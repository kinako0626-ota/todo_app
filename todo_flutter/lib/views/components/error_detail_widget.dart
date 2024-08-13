import 'package:flutter/material.dart';

class ErrorDetailWidget extends StatelessWidget {
  const ErrorDetailWidget({
    required this.error,
    required this.onRetry,
    super.key,
  });

  final Object error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Error: $error',
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: onRetry,
          child: const Text('Retry'),
        ),
      ],
    );
  }
}
