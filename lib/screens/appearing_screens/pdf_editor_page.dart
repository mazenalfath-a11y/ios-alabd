import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
// import 'package:path_provider/path_provider.dart';

class PdfEditorPage extends StatefulWidget {
  final String title;
  final String pdfPath;
  final String pdfId;

  const PdfEditorPage({
    super.key,
    required this.title,
    required this.pdfPath,
    required this.pdfId,
  });

  @override
  State<PdfEditorPage> createState() => _PdfEditorPageState();
}

class _PdfEditorPageState extends State<PdfEditorPage> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initWebView();
  }

  void _initWebView() {
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
            _loadPdfIntoEditor();
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('Web Resource Error: ${error.description}');
          },
        ),
      );

    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }

    _controller = controller;

    // Load local asset
    _controller.loadFlutterAsset('assets/pdf_editor/index.html');
  }

  Future<void> _loadPdfIntoEditor() async {
    try {
      final file = File(widget.pdfPath);
      if (await file.exists()) {
        final bytes = await file.readAsBytes();
        final base64 = base64Encode(bytes);
        // Ensure same file yields same ID
        final identifier = widget.pdfId.isNotEmpty
            ? widget.pdfId
            : (widget.title.isNotEmpty ? widget.title : "document");
        final fileName = "$identifier.pdf";

        // Use a slight delay to ensure JS is ready
        await Future.delayed(const Duration(milliseconds: 500));

        // Escape filename just in case
        final safeName = fileName.replaceAll("'", "\\'");

        await _controller.runJavaScript(
            "window.loadPDFFromFlutter('$base64', '$safeName');");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not find PDF file')),
        );
      }
    } catch (e) {
      debugPrint('Error loading PDF: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading PDF: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
