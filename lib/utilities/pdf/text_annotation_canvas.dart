import 'package:flutter/material.dart';

class TextAnnotationCanvas extends StatelessWidget {
  final String pdfId;
  final int pageIndex;
  final bool enabled;

  const TextAnnotationCanvas({
    super.key,
    required this.pdfId,
    required this.pageIndex,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        color: Colors.transparent,
        child: Center(
          child: Text(
            "صفحة $pageIndex",
            style: TextStyle(color: Colors.black45),
          ),
        ),
      ),
    );
  }
}
