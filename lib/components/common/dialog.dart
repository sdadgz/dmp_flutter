import 'package:flutter/material.dart';

class SConfirmDialog extends StatelessWidget {
  const SConfirmDialog(
      {Key? key,
      required this.confirm,
      required this.children,
      this.title = "编辑配置"})
      : super(key: key);

  // 点击确认回调
  final String title;
  final void Function() confirm;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: Column(
          children: children,
        ),
      ),
      actions: [
        // 取消
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("取消", style: TextStyle(color: Colors.grey)),
        ),
        // 确认
        TextButton(
          onPressed: confirm,
          child: const Text("确定"),
        ),
      ],
    );
  }
}
