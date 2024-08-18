import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_flutter/models/todo.dart';
import 'package:todo_flutter/views/components/error_detail_widget.dart';
import 'package:todo_flutter/views/components/todo_list_tile.dart';
import 'package:todo_flutter/views/todo_list_page_notifier.dart';

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
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();
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
                return TodoListTile(
                  title: todo.title,
                  description: todo.description,
                  isDone: todo.done,
                  onTap: () {
                    // 詳細画面に遷移
                  },
                  onCheckboxChanged: (bool? value) async {
                    await ref
                        .read(todoListPageNotifierProvider.notifier)
                        .updateTodo(todo: todo.copyWith(done: value ?? false));
                  },
                  deleteAction: () async {
                    await ref
                        .read(todoListPageNotifierProvider.notifier)
                        .deleteTodo(
                          id: todo.id,
                        );
                  },
                );
              },
            );
          },
          error: (error, stackTrace) => ErrorDetailWidget(
            error: error,
            onRetry: () async {
              await notifier.getTodos();
            },
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Create Todo'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                          controller: titleController,
                          decoration: const InputDecoration(
                            labelText: 'Title',
                          )),
                      TextField(
                          controller: descriptionController,
                          decoration: const InputDecoration(
                            labelText: 'Description',
                          )),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () async {
                        final todo = Todo(
                          title: titleController.text,
                          description: descriptionController.text,
                          done: false,
                          userId: 1,
                          createdAt: DateTime.now(),
                          updatedAt: DateTime.now(),
                        );
                        // Create Todo
                        await ref
                            .read(todoListPageNotifierProvider.notifier)
                            .createTodo(
                              todo: todo,
                            );
                        Navigator.of(context).pop();
                      },
                      child: const Text('Create'),
                    ),
                  ],
                );
              },
            );
          },
        ));
  }
}
