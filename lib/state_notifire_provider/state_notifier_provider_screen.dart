import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider.dart';

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // StateNotifierProviderを読み取る。watchを使用しているので、
    // state（状態）であるTODOリストが更新されると、buildメソッドが再実行されて画面が更新される
    final todoList = ref.watch(todoListNotifierProvider);
    // TodoListNotifier を使用する場合は `.notifier` を付けてProviderを読み取る
    final notifier = ref.watch(todoListNotifierProvider.notifier);

    // 新しいTodoを追加するプライベートメソッドを定義
    void addTodo() {
      final newTodo = Todo(
          id: Random().nextDouble().toString(),
          title: DateTime.now().toIso8601String());
      notifier.add(newTodo);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('StateNotifierProvider example'),
        actions: [
          // ボタンを押して新しいTodoを追加できる（実際はTodoのタイトル等を入力できるようにすると良い）
          IconButton(onPressed: addTodo, icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          final todo = todoList[index];
          return ListTile(
            // TodoのタイトルをTextで表示
            title: Text(todo.title),
            leading: Icon(
              todo.completed ? Icons.check_box : Icons.check_box_outline_blank,
            ),
            trailing: TextButton(
              onPressed: () => notifier.remove(todo.id),
              child: const Text('Delete'),
            ),
            // タップでTODOの完了状態を切り替える
            onTap: () => notifier.toggle(todo.id),
          );
        },
      ),
    );
  }
}
