import 'package:flutter/material.dart';

// 标题
class STitle extends StatelessWidget {
  const STitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20));
  }
}
