import 'package:flutter/material.dart';

extension ThemeModeExt on ThemeMode {
  String get subtitle {
    switch (this) {
      case ThemeMode.light:
        return 'ライトモード';
      case ThemeMode.dark:
        return 'ダークモード';
      case ThemeMode.system:
        return '端末の設定に合わせる';
    }
  }
}
