import 'dart:convert';

import 'package:demo/components/common/card.dart';
import 'package:demo/components/common/log.dart';
import 'package:demo/components/common/udp.dart';
import 'package:demo/components/dmp/dmp_button.dart';
import 'package:demo/components/home/devices_info.dart';
import 'package:demo/pages/dmp.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../components/home/constant.dart';

class Home extends StatefulWidget {
  const Home({Key? key, this.title = "标题"}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // 存放设备列表
  List<Devices> devicesList = [];

  // 获取在线设备等
  List<Widget> _getDevicesInfo() {
    List<Widget> res = [];
    res.add(DevicesInfo(count: devicesList.length, label: "设备总数"));
    res.add(DevicesInfo(
        count: devicesList.where((element) => element.state == 1).length,
        label: "在线设备"));
    res.add(DevicesInfo(
        count: devicesList.where((element) => element.state != 1).length,
        label: "故障设备"));
    return res;
  }

  // 获取设备列表
  List<DevicesDetails> _getDevicesList() {
    List<DevicesDetails> res = [];
    setState(() {
      List<DevicesDetails> list = devicesList
          .map((e) => DevicesDetails(
                nameCode: e.nameCode,
                devicesState: e.state,
                address: e.address,
                port: e.port,
              ))
          .toList();
      res.addAll(list);
    });
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            color: Colors.white54,
            child: ListView(
              children: [
                SCard(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // udp获取数据
                      ..._getDevicesInfo()
                    ],
                  ),
                ),
                SCard(
                  child: Column(
                    children: [
                      // udp获取数据
                      const Text(
                        "设备列表",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      ..._getDevicesList(),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // 监听 /heartbeat
    Udp.receive((str, address, port) {
      setState(() {
        var map = jsonDecode(str);
        switch (map["uri"]) {
          case "/heartbeat":
            // 心跳

            // 实例化设备
            Devices devices = Devices(
              uri: map["uri"],
              nameCode: map["nameCode"],
              state: map["state"],
              serialNumber: map["serialNumber"],
              address: address,
              port: port,
            );

            // 加进去
            bool flag = true;
            for (var element in devicesList) {
              if (element.serialNumber == devices.serialNumber) {
                flag = false;
                break;
              } // todo 相同应该覆盖，懒，不想写了
            }
            if (flag) {
              devicesList.add(devices);
            }

            break;
          default:
            Log.warn("非法的请求");
        }
      });
    });
  }
}
