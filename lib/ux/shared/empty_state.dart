import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.drawable,
    required this.text,
  });

  final String drawable;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(drawable),
        Text(
          text,
          style: Theme.of(context).textTheme.displaySmall,
        )
      ],
    );
  }
}
