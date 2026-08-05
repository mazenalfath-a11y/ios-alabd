import 'dart:developer';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

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

  @override
  void initState() {
    super.initState();

    final videoId = _extractVideoId(widget.videoUrl);

    late final PlatformWebViewControllerCreationParams webViewParams;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      webViewParams = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      webViewParams = const PlatformWebViewControllerCreationParams();
    }

    final navigationDelegate = NavigationDelegate(
      onWebResourceError: (error) {
        log('[WEBVIEW ERROR] ${error.description}', name: 'WebViewError');
      },
      onNavigationRequest: (request) {
        final uri = Uri.tryParse(request.url);

        if (uri == null) {
          return NavigationDecision.prevent;
        }

        if (uri.host.contains('coursesapp.github.io') ||
            uri.host.contains('youtube.com') ||
            uri.host.contains('youtube-nocookie.com')) {
          return NavigationDecision.navigate;
        }

        if (uri.path == '/watch' && uri.queryParameters.containsKey('v')) {
          return NavigationDecision.navigate;
        }

        return NavigationDecision.prevent;
      },
    );

    _controller = WebViewController.fromPlatformCreationParams(webViewParams)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(navigationDelegate)
      ..setUserAgent(
        'Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Mobile/15E148 Safari/604.1',
      )
      ..enableZoom(false)
      ..loadRequest(
        Uri.parse(
          'https://coursesapp.github.io/youtube_embedded_video/?video=$videoId&watermark=${widget.watermarkText}',
        ),
      );

    final webViewPlatform = _controller.platform;
    if (webViewPlatform is AndroidWebViewController) {
      webViewPlatform.setMediaPlaybackRequiresUserGesture(false);
    } else if (webViewPlatform is WebKitWebViewController) {
      webViewPlatform.setAllowsBackForwardNavigationGestures(false);
    }
  }

  String _extractVideoId(String url) {
    final regex = RegExp(r"(?:v=|\/embed\/|youtu\.be\/)([a-zA-Z0-9_-]{11})");
    final match = regex.firstMatch(url);
    return match?.group(1) ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: WebViewWidget(controller: _controller),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 30),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
