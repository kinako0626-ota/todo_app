import 'package:flutter/material.dart';
import 'package:todo_flutter/views/components/todo_list_tile.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'TodoListTile',
  type: TodoListTile,
  path: '[widgets]/todo_list_tile',
)
Widget buildErrorDetailWidgetUseCase(BuildContext context) {
  return TodoListTile(
    title: context.knobs.string(
      label: 'title',
    ),
    description: context.knobs.string(
      label: 'description',
    ),
    isDone: context.knobs.boolean(
      label: 'isDone',
    ),
    onTap: () {},
    onCheckboxChanged: (bool? value) {},
    deleteAction: () {},
  );
}
