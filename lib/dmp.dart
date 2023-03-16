import 'package:demo/compoments/common/Button.dart';
import 'package:flutter/material.dart';

class Dmp extends StatelessWidget {
  const Dmp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: FilledButton(
      onPressed: null,
      child: Text("data"),
    ));
  }
}
