import 'package:flutter/material.dart';

class BaseOverlay {
  Map<Overlays, OverlayEntry> _overlayEntries = {};
  void addOverlay(Overlays overlay, Widget widget, BuildContext? context) {
    if (_overlayEntries.containsKey(overlay)) {
      return;
    }
    OverlayEntry entry = OverlayEntry(builder: (context) {
      return widget;
    });
    OverlayState? overlayState = Overlay.maybeOf(context!);
    if (overlayState != null) {
      overlayState.insert(entry);
      _overlayEntries[overlay] = entry;
    }
  }

  void removeOverlay(Overlays overlay) {
    if (_overlayEntries.containsKey(overlay)) {
      _overlayEntries[overlay]!.remove();
      _overlayEntries.remove(overlay);
    }
  }
}

enum Overlays {
  GameOver,
  GameWon,
}
