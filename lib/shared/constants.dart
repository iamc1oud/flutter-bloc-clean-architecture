import 'package:flutter/material.dart';

final appNavigationKey = GlobalKey<NavigatorState>();

// Spacings
class Spacing {
  static smallHeight() {
    return const SizedBox(height: 12);
  }

  static mediumHeight() {
    return const SizedBox(height: 18);
  }

  static largeHeight() {
    return const SizedBox(height: 24);
  }
}
