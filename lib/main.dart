import 'package:demo/dmp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.accessibility_outlined),
        title: const Text("小测试咯"),
      ),
      body: const Dmp(),
    ),
  ));
}