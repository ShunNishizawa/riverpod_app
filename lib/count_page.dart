import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/Providers/counter_provider.dart';
import 'package:riverpod_app/Providers/counter_provider2.dart';

class CountPage extends ConsumerWidget {
  const CountPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 従来のRiverpodのやり方
    final counter = ref.watch(countProvider);
    final counterNotifier = ref.watch(countProvider.notifier);

    // generaterバージョン
    // final counter = ref.watch(counter2Provider);
    // final counterNotifier = ref.watch(counter2Provider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
              child: Text('リセット'),
            )
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
