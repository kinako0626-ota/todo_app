import 'package:flutter/material.dart';

class TodoListTile extends StatelessWidget {
  const TodoListTile({
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
  final ValueChanged<bool?>? onCheckboxChanged;
  final VoidCallback onTap;
  final VoidCallback deleteAction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: isDone
            ? const TextStyle(
                decoration: TextDecoration.lineThrough,
              )
            : null,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      leading: Checkbox.adaptive(
        value: isDone,
        onChanged: onCheckboxChanged,
      ),
      onTap: onTap,
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: deleteAction,
      ),
    );
  }
}
