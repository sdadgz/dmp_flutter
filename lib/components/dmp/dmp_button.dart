import 'dart:io';

import 'package:demo/components/common/udp.dart';
import 'package:demo/components/dmp/constant.dart';
import 'package:flutter/material.dart';
import 'package:udp/udp.dart';

// udp发送信息按钮
class UdpButtonFul extends StatefulWidget {
  const UdpButtonFul(
      {super.key,
      this.label = "按钮",
      required this.msg,
      required this.address,
      required this.port});

  final String label;
  final String msg;

  // ip port
  final InternetAddress address;
  final int port;

  @override
  State<UdpButtonFul> createState() => _UdpButtonFulState();
}

class _UdpButtonFulState extends State<UdpButtonFul> {
  // 点击按钮
  void _click() {
    setState(() {
      Udp.sendHex(widget.msg, widget.address, widget.port);
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
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

// udp发送信息按钮组
class UdpButtonsGrid extends StatefulWidget {
  const UdpButtonsGrid(
      {Key? key,
      required this.modList,
      required this.address,
      required this.port})
      : super(key: key);

  final List<DevicesMod> modList;
  final InternetAddress address;
  final int port;

  @override
  State<UdpButtonsGrid> createState() => _UdpButtonsGridState();
}

class _UdpButtonsGridState extends State<UdpButtonsGrid> {
  List<Widget> children = [];

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100),
      children: children,
    );
  }

  @override
  void initState() {
    super.initState();
    children = widget.modList
        .map((e) => UdpButtonFul(
              msg: e.msg,
              address: widget.address,
              port: widget.port,
              label: e.label,
            ))
        .toList();
  }
}
