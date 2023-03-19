import 'package:flutter/material.dart';

class SCard extends StatelessWidget {
  const SCard(
      {Key? key,
      this.child = const Text("卡片"),
      this.color = Colors.lightBlueAccent})
      : super(key: key);

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      color: color,
      shadowColor: Colors.grey,
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: child,
      ),
    );
  }
}
