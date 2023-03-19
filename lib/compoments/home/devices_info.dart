import 'package:demo/compoments/home/constant.dart';
import 'package:flutter/material.dart';

// 设备在线信息
class DevicesInfo extends StatelessWidget {
  const DevicesInfo({Key? key, this.count = 114514, this.label = "在线设备"})
      : super(key: key);

  final int count;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(count.toString()),
        Text(label),
      ],
    );
  }
}

// 设备详情卡片
class DevicesDetails extends StatelessWidget {
  const DevicesDetails(
      {Key? key, required this.nameCode, required this.devicesState})
      : super(key: key);

  final int nameCode; // 设备名代码
  final int devicesState; // 设备状态

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("设备名：${getDevicesName(nameCode)}",
              style: const TextStyle(color: Colors.black)),
          Text("状态：${getDevicesState(devicesState)}",
              style: const TextStyle(color: Colors.black))
        ],
      ),
    );
  }
}
