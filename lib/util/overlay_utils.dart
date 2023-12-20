import 'package:flutter/material.dart';

class OverlayUtils {
  OverlayEntry? _overlayEntry;

  void showOverlay(BuildContext context, Widget overlayWidget) {
    _overlayEntry = OverlayEntry(builder: (_) => overlayWidget);
    Overlay.of(context)
        .insert(_overlayEntry!); // Make sure the context is correct
  }

  // removeOverlay함수
  void removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
