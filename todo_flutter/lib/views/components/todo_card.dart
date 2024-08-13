import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    required this.title,
    required this.description,
    required this.isDone,
    required this.onCheckboxChanged,
    required this.onTap,
    required this.deleteAction,
    super.key,
  });

  final String title;
  final String description;
  final bool isDone;
  final ValueChanged<bool> onCheckboxChanged;
  final VoidCallback onTap;
  final VoidCallback deleteAction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(description),
      leading: Checkbox.adaptive(
        value: isDone,
        onChanged: (c) {
          if (c != null) {
            onCheckboxChanged(c);
          }
        },
      ),
      onTap: onTap,
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: deleteAction,
      ),
    );
  }
}
