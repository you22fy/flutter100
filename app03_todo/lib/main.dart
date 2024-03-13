import 'package:app03_todo/provider.dart';
import 'package:app03_todo/todo.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TodoListPage(),
    );
  }
}

class TodoListPage extends ConsumerWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Todo> todos = ref.watch(todoListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('ToDo List')),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return ListTile(
            title: Text(todo.title),
            leading: Checkbox(
              value: todo.completed,
              onChanged: (bool? value) {
                ref.read(todoListProvider.notifier).toggle(todo.id);
              },
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                ref.read(todoListProvider.notifier).remove(todo);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showAddTodoDialog(context, ref),
      ),
    );
  }

  void _showAddTodoDialog(BuildContext context, WidgetRef ref) {
    TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add ToDo'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'ToDo title'),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text('Add'),
            onPressed: () {
              final title = controller.text.trim();
              if (title.isNotEmpty) {
                ref.read(todoListProvider.notifier).add(title);
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
    );
  }
}
