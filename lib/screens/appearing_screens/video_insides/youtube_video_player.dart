import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_version/screens/appearing_screens/video_insides/youtube_fullscreen_page.dart';
// import 'package:flutter_version/widgets/watch_time_helper.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:flutter_version/widgets/video_overlay_manager.dart';

import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import 'dart:developer'; // 👈 ده عشان log()
// import 'package:url_launcher/url_launcher.dart'; // 👈 ده عشان launchUrl()

typedef YoutubeWebResourceError = WebResourceError;

class YoutubeVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final String watermarkText;

  const YoutubeVideoPlayer({
    super.key,
    required this.videoUrl,
    required this.watermarkText,
    this.startAt = 0.0,
    this.isMini = false,
    this.onFloatPressed,
  });

  final double startAt;
  final bool isMini;
  final VoidCallback? onFloatPressed;

  @override
  State<YoutubeVideoPlayer> createState() => _YoutubeVideoPlayerState();
}

class _YoutubeVideoPlayerState extends State<YoutubeVideoPlayer> {
  final List<double> speedOptions = [0.25, 0.5, 1.0, 1.5, 2.0];
  double selectedSpeed = 1.0;

  late final WebViewController _controller;

  double currentTime = 0;
  double duration = 1;
  double position = 0;

  bool isPlaying = false;
  bool isMuted = false;

  bool showOverlay = false;

  @override
  void initState() {
    super.initState();

    // Check if it's a Vimeo URL
    final isVimeo = widget.videoUrl.toLowerCase().contains('vimeo');
    final videoId = isVimeo ? '' : _extractVideoId(widget.videoUrl);

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

        // ✅ Allow your site, YouTube, and Vimeo hosts
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
            !(uri.host.contains('youtube') || uri.host.contains('github.io'))) {
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
              : 'https://coursesapp.github.io/youtube_embedded_video/?video=$videoId&watermark=${widget.watermarkText}&start=${widget.startAt.toInt()}',
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

  // Future<void> _seekTo(double seconds) async =>
  //     _controller.runJavaScript("seekTo($seconds)");

  // === Idea 3: Fullscreen open and return to same position ===
  Future<void> _openFullScreen() async {
    final returnedTime = await Navigator.of(context).push<double>(
      MaterialPageRoute(
        builder: (_) => YoutubeFullscreenPage(
          videoUrl: widget.videoUrl,
          watermarkText: widget.watermarkText,
        ),
      ),
    );

    if (returnedTime != null) {
      // await _seekTo(returnedTime);
      setState(() {
        position = returnedTime;
      });
    }
  }

  // === Idea 2: Save watch time when disposed ===
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  WebViewWidget(controller: _controller),
                  if (!widget.isMini && widget.onFloatPressed != null)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: InkWell(
                        onTap: widget.onFloatPressed,
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.picture_in_picture_alt,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  if (!widget.isMini)
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: InkWell(
                        onTap: _openFullScreen,
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.fullscreen,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
