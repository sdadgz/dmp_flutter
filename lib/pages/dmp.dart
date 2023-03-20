import 'dart:io';

import 'package:demo/components/common/card.dart';
import 'package:demo/components/common/constant.dart';
import 'package:demo/components/common/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../components/common/log.dart';
import '../components/common/udp.dart';
import '../components/dmp/constant.dart';
import '../components/dmp/dmp_button.dart';

class Dmp extends StatefulWidget {
  const Dmp(
      {Key? key,
      this.title = "小测试咯",
      required this.address,
      required this.port})
      : super(key: key);

  // 页面标题
  final String title;

  // ip port
  final InternetAddress address;
  final int port;

  @override
  State<Dmp> createState() => _DmpState();
}

class _DmpState extends State<Dmp> {
  // 初始化
  String? _errorText;

  // 初始化controller
  late TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // 头
        appBar: AppBar(
          title: Text(widget.title),
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_outlined),
          ),
        ),

        // 主体
        body: Container(
          color: Colors.white54,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // 等速模式
              const STitle(title: "等速模式"),
              Expanded(
                child: UdpButtonsGrid(
                  modList: constantVelocityModMap,
                  address: widget.address,
                  port: widget.port,
                ),
              ),
              // const Divider(),
              //
              // // 被动模式
              // const STitle(title: "被动模式"),
              // UdpButtonsGrid(
              //   modList: passiveModMap,
              //   address: widget.address,
              //   port: widget.port,
              // ),
              // const Divider(),
              //
              // // 主动模式
              // const STitle(title: "主动模式"),
              // UdpButtonsGrid(
              //   modList: activeModMap,
              //   address: widget.address,
              //   port: widget.port,
              // ),
            ],
          ),
        ),

        // 右下角悬浮按钮
        floatingActionButton: FloatingActionButton(
          onPressed: () => showCupertinoDialog(
            context: context,
            builder: _newShowEditDialog,
          ),
          child: const Icon(Icons.edit),
        ),
      ),
    );
  }

  // 新弹窗
  Widget _newShowEditDialog(BuildContext context) {
    controller = TextEditingController();
    // 设置值
    controller.text = Udp.targetPort.toString();

    return SConfirmDialog(
      confirm: () {
        final int port = int.parse(controller.text);
        if (port > 0 && port <= 65535) {
          Udp.targetPort = port;
          Navigator.pop(context);
          Log.info(port);
        }
      },
      children: [
        StatefulBuilder(
          builder: (context, setState) => TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            onChanged: (text) {
              setState(() {
                final int port = int.parse(text);
                if (port > 0 && port <= 65535) {
                  _errorText = null;
                  Log.info(port);
                } else {
                  _errorText = numberOutOfPortErrorText;
                  Log.error(_errorText);
                }
              });
            },
            decoration: InputDecoration(
              hintText: "输入端口号",
              labelText: "端口",
              errorText: _errorText,
            ),
          ),
        )
      ],
    );
  }
}
