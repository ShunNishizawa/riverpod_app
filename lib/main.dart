import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/Providers/themeSelectorProvider/theme_selector_provider2.dart';
import 'package:riverpod_app/count_page.dart';
import 'package:riverpod_app/themes/theme_data.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: ref.watch(themeSelector2Provider),
      home: const CountPage(title: 'CountPage'),
    );
  }
}
