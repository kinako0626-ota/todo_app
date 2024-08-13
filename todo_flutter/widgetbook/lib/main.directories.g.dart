// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _i1;
import 'package:widgetbook_workspace/components/error_detail_widget.dart'
    as _i2;
import 'package:widgetbook_workspace/components/todo_list_tile.dart' as _i3;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookCategory(
    name: 'widgets',
    children: [
      _i1.WidgetbookFolder(
        name: 'error_detail_widget',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'ErrorDetailWidget',
            useCase: _i1.WidgetbookUseCase(
              name: 'ErrorDetailWidget',
              builder: _i2.buildErrorDetailWidgetUseCase,
            ),
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'todo_list_tile',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'TodoListTile',
            useCase: _i1.WidgetbookUseCase(
              name: 'TodoListTile',
              builder: _i3.buildErrorDetailWidgetUseCase,
            ),
          )
        ],
      ),
    ],
  )
];
