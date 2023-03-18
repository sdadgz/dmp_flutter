import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../compoments/common/dmp/constant.dart';
import '../compoments/common/dmp/dmp_button.dart';
import '../compoments/common/log.dart';
import '../compoments/common/udp.dart';

class Dmp extends StatefulWidget {
  const Dmp({Key? key}) : super(key: key);

  @override
  State<Dmp> createState() => _DmpState();
}

class _DmpState extends State<Dmp> {
  // 初始化
  String? _errorText;

  // 初始化controller
  late TextEditingController controller;

  // 弹窗
  Widget _showEditDialog(BuildContext context) {
    controller = TextEditingController();
    // 设置值
    controller.text = Udp.port.toString();

    return StatefulBuilder(builder: (context, setState) {
      return AlertDialog(
        title: const Text("编辑设置"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
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
                    hintText: "输入端口号", labelText: "端口", errorText: _errorText),
              ),
            ],
          ),
        ),
        actions: [
          // 取消
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "取消",
                style: TextStyle(color: Colors.grey),
              )),
          // 确认
          TextButton(
              onPressed: () {
                final int port = int.parse(controller.text);
                if (port > 0 && port <= 65535) {
                  Udp.port = port;
                  Log.info(port);
                  Navigator.pop(context);
                } else {
                  _errorText = numberOutOfPortErrorText;
                  Log.error(_errorText);
                }
              },
              child: const Text("确定"))
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("小测试咯"),
        ),
        body: Container(
            color: Colors.white70,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  UdpButtonFul(
                    label: "开始",
                    msg: startMsg,
                  ),
                  UdpButtonFul(label: "暂停", msg: pauseMsg),
                ],
              ),
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              showCupertinoDialog(context: context, builder: _showEditDialog),
          child: const Icon(Icons.edit),
        ),
      ),
    );
  }
}