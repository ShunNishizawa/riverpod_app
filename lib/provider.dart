import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/state_notifire_provider/state_notifier_provider_page.dart';

final appNameProvider = Provider((ref) => 'My TODO');
final counterProvider = StateProvider((ref) => 0);
final doubleCounterProvider = Provider((ref) {
  final count = ref.watch(counterProvider);
  return count * 2;
});

// StateNotifierProvider
final todoListNotifierProvider =
    StateNotifierProvider<TodoListNotifier, List<Todo>>(
  (ref) => TodoListNotifier(),
);

// FutureProvider
final configProvider = FutureProvider<Map<String, Object?>>((ref) async {
  final jsonString = await rootBundle.loadString('assets/config.json');
  final content = json.decode(jsonString) as Map<String, Object?>;
  return content;
});
