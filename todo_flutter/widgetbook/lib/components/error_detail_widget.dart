import 'package:flutter/material.dart';
import 'package:todo_flutter/views/components/error_detail_widget.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'ErrorDetailWidget', type: ErrorDetailWidget)
Widget buildErrorDetailWidgetUseCase(BuildContext context) {
  return ErrorDetailWidget(
    error: 'error',
    onRetry: () {},
  );
}
