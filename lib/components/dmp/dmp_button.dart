import 'dart:math';

import 'package:demo/components/common/udp.dart';
import 'package:flutter/material.dart';

class UdpButtonFul extends StatefulWidget {
  const UdpButtonFul({super.key, this.label = "按钮", required this.msg});

  final String label;
  final String msg;

  @override
  State<UdpButtonFul> createState() => _UdpButtonFulState();
}

class _UdpButtonFulState extends State<UdpButtonFul> {
  // 点击按钮
  void _click() {
    setState(() {
      Udp.broadcastHex(widget.msg);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: _click,
        child: Text(
          widget.label,
        ),
      ),
    );
  }
}
