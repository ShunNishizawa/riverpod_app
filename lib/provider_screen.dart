import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/main.dart';

import 'package:riverpod_app/provider.dart';

class ProviderScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appName = ref.watch(appNameProvider);
    final doubleCount = ref.watch(doubleCounterProvider);
    final counter = ref.watch(counterProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
      ),
      body: ElevatedButton(
          onPressed: () => counter.update((state) => state + 1),
          child: Text('count: ${ref.watch(counterProvider)}')),
    );
  }
}
