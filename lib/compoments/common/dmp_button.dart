import 'dart:math';

import 'package:demo/compoments/common/udp.dart';
import 'package:flutter/material.dart';

import 'package:udp/udp.dart';

class UdpButtonFul extends StatefulWidget {
  const UdpButtonFul(
      {super.key, this.label = "按钮", this.callback, required this.msg});

  final String label;
  final Function? callback;
  final String msg;

  @override
  State<UdpButtonFul> createState() => _UdpButtonFulState();
}

class _UdpButtonFulState extends State<UdpButtonFul> {
  // 点击按钮
  void _click() {
    setState(() {
      Udp.send(widget.msg);
      widget.callback!();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        height: 50,
        child: ElevatedButton(onPressed: _click, child: Text(widget.label)));
  }
}
