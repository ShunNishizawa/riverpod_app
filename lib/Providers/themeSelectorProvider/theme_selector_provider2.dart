import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_selector_provider2.g.dart';

@riverpod
class ThemeSelector2 extends _$ThemeSelector2 {
  @override
  ThemeMode build() => ThemeMode.system;

  Future<void> change(ThemeMode mode) async {
    state = mode;
  }
}
