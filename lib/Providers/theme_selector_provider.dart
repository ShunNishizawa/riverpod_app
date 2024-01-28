import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeSelector extends StateNotifier<ThemeMode> {
  ThemeSelector() : super(ThemeMode.light);

  /// テーマの変更
  Future<void> changeTheme(ThemeMode theme) async {
    state = theme;
  }
}

final themeSelectorProvider =
    StateNotifierProvider<ThemeSelector, ThemeMode>((ref) => ThemeSelector());
