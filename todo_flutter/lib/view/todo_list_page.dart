import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_flutter/view/todo_list_page_notifier.dart';

class TodoListPage extends HookConsumerWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        Future.microtask(() async {
          await ref.read(todoListPageNotifierProvider.notifier).getTodos();
        });
        return null;
      },
      const [],
    );
    final notifier = ref.watch(todoListPageNotifierProvider.notifier);
    final state = ref.watch(todoListPageNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: state.todos.when(
        data: (todos) {
          if (todos.isEmpty) {
            return const Center(
              child: Text('No todos'),
            );
          }
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ListTile(
                title: Text(todo.title),
                subtitle: Text(todo.description),
              );
            },
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Error: $error'),
                ElevatedButton(
                  onPressed: () async => await notifier.getTodos(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
