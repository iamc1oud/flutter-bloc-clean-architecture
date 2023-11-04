import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  padding(EdgeInsets p) {
    return Padding(padding: p, child: this);
  }
}

extension AlignmentExtension on Widget {
  centerAlign() {
    return Align(alignment: Alignment.center, child: this);
  }

  leftAlign() {
    return Align(alignment: Alignment.centerLeft, child: this);
  }

  rightAlign() {
    return Align(alignment: Alignment.centerRight, child: this);
  }
}