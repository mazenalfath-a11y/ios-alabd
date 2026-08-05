// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_version/utilities/app_colors.dart';
import 'package:flutter_version/utilities/theme_provider.dart';
import 'package:provider/provider.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:youtube_player_iframe/youtube_player_iframe.dart';
// import 'package:flutter_version/widgets/watch_time_helper.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import 'dart:developer'; // 👈 ده عشان log()
// import 'package:url_launcher/url_launcher.dart'; // 👈 ده عشان launchUrl()

class YoutubeFullscreenPage extends StatefulWidget {
  final String videoUrl;
  final String watermarkText;

  const YoutubeFullscreenPage({
    super.key,
    required this.videoUrl,
    this.watermarkText = "",
  });

  @override
  State<YoutubeFullscreenPage> createState() => _YoutubeFullscreenPageState();
}

class _YoutubeFullscreenPageState extends State<YoutubeFullscreenPage> {
  late final WebViewController _controller;

  double _selectedAspectRatio = 16 / 9;

  @override
  void initState() {
    super.initState();

    final videoId = _extractVideoId(widget.videoUrl);
    final isVimeo = widget.videoUrl.toLowerCase().contains('vimeo');

    // Add WebKit configuration for iOS inline playback
    late final PlatformWebViewControllerCreationParams webViewParams;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      webViewParams = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true, // ← This enables inline playback
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{}, // ← This allows autoplay
      );
    } else {
      webViewParams = const PlatformWebViewControllerCreationParams();
    }

    // ✅ IMPROVED NavigationDelegate
    final navigationDelegate = NavigationDelegate(
      onWebResourceError: (error) {
        log('[WEBVIEW ERROR] ${error.description}', name: 'WebViewError');
      },
      onNavigationRequest: (request) {
        final uri = Uri.tryParse(request.url);

        if (uri == null) {
          log('[BLOCKED] Invalid URL');
          return NavigationDecision.prevent;
        }

        // ✅ Allow your site, YouTube hosts, and Vimeo hosts
        if (uri.host.contains('coursesapp.github.io') ||
            uri.host.contains('youtube.com') ||
            uri.host.contains('youtube-nocookie.com') ||
            uri.host.contains('vimeo.com') ||
            uri.host.contains('player.vimeo.com')) {
          log('[ALLOWED] ${uri.host}${uri.path}');
          return NavigationDecision.navigate;
        }

        // ✅ Allow YouTube video URLs like /watch?v=...
        if (uri.path == '/watch' && uri.queryParameters.containsKey('v')) {
          log('[YOUTUBE VIDEO ALLOWED] ${uri.queryParameters['v']}');
          return NavigationDecision.navigate;
        }

        // 🌐 Open external links in browser
        if (uri.scheme.startsWith('http') &&
            !(uri.host.contains('youtube') ||
                uri.host.contains('github.io') ||
                uri.host.contains('vimeo'))) {
          log('[EXTERNAL LINK OPENED] ${uri.toString()}');
          return NavigationDecision.prevent;
        }

        // 🚫 Block everything else
        log('[BLOCKED] ${uri.toString()}');
        return NavigationDecision.prevent;
      },
    );

    // CORRECTED: Use the static method WebViewController.fromPlatformCreationParams
    _controller = WebViewController.fromPlatformCreationParams(webViewParams)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(navigationDelegate)
      ..setUserAgent(
        'Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Mobile/15E148 Safari/604.1',
      )
      ..enableZoom(false)
      ..loadRequest(
        Uri.parse(
          isVimeo
              ? widget.videoUrl // Load Vimeo URL directly
              : 'https://coursesapp.github.io/youtube_embedded_video/?video=$videoId&watermark=${widget.watermarkText}',
        ),
      );

    // Add iOS-specific configuration
    final webViewPlatform = _controller.platform;
    if (webViewPlatform is AndroidWebViewController) {
      webViewPlatform.setMediaPlaybackRequiresUserGesture(false);
    } else if (webViewPlatform is WebKitWebViewController) {
      webViewPlatform.setAllowsBackForwardNavigationGestures(false);
      // iOS inline playback is enabled by the creation params above
    }
  }

  String _extractVideoId(String url) {
    final regex = RegExp(r"(?:v=|\/embed\/|youtu\.be\/)([a-zA-Z0-9_-]{11})");
    final match = regex.firstMatch(url);
    return match?.group(1) ?? "";
  }

  @override
  void dispose() {
    super.dispose();
  }

  String formatRatio(double ratio) {
    if (ratio == 16 / 9) return "16:9";
    if (ratio == 4 / 3) return "4:3";
    if (ratio == 1.0) return "1:1";
    if (ratio == 21 / 9) return "21:9";
    if (ratio == 9 / 16) return "9:16";
    return ratio.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: AppColors.getBackgroundColor(isDark),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Center(
                  child: AspectRatio(
                    aspectRatio: _selectedAspectRatio,
                    child: WebViewWidget(controller: _controller),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
