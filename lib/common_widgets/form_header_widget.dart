import 'package:flutter/material.dart';

class FormHeader extends StatelessWidget {
  const FormHeader({super.key, required this.title, required this.description});
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineMedium),
          Text(description, style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
