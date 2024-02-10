import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/Providers/counter_provider.dart';
import 'package:riverpod_app/Providers/counter_provider2.dart';
import 'package:riverpod_app/Providers/themeSelectorProvider/theme_selector_provider2.dart';
import 'package:riverpod_app/Providers/theme_selector_provider.dart';

class CountPage extends ConsumerWidget {
  const CountPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 従来のRiverpodのやり方
    final counter = ref.watch(countProvider);
    final counterNotifier = ref.watch(countProvider.notifier);
    // 従来のやり方
    // final themeSelectorNotifier = ref.watch(themeSelectorProvider.notifier);
    // ジェネレータバージョン
    final themeSelectorNotifier = ref.watch(themeSelector2Provider.notifier);

    ref.listen<int>(countProvider, ((previous, next) {
      if (next.isEven) {
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Text('偶数です'),
              );
            });
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Text('奇数です'),
              );
            });
      }
    }));

    // generaterバージョン
    // final counter = ref.watch(counter2Provider);
    // final counterNotifier = ref.watch(counter2Provider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            MaterialButton(
              onPressed: () => counterNotifier.reset(),
              child: Text(
                'リセット',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            TextButton(
                onPressed: () => themeSelectorNotifier.change(ThemeMode.light),
                child: const Text('ライトモード')),
            TextButton(
                onPressed: () => themeSelectorNotifier.change(ThemeMode.dark),
                child: const Text('ダークモード')),
            TextButton(
                onPressed: () => themeSelectorNotifier.change(ThemeMode.system),
                child: const Text('システムに合わせる')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterNotifier.increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This
    );
  }
}
