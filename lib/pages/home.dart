import 'package:demo/compoments/common/card.dart';
import 'package:demo/compoments/common/log.dart';
import 'package:demo/compoments/common/udp.dart';
import 'package:demo/compoments/dmp/dmp_button.dart';
import 'package:demo/compoments/home/devices_info.dart';
import 'package:demo/pages/dmp.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key, this.title = "标题"}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                    children: const [
                      // todo udp获取数据
                      DevicesInfo(count: 1, label: "设备总数"),
                      DevicesInfo(count: 1, label: "在线设备"),
                      DevicesInfo(count: 0, label: "故障设备"),
                    ],
                  ),
                ),
                SCard(
                  child: Column(
                    children: [
                      // todo udp获取数据
                      const DevicesDetails(nameCode: 0, devicesState: 1),
                      const DevicesDetails(nameCode: 0, devicesState: 1),
                      ElevatedButton(
                        onPressed: () async {
                          Udp.receive(() {});
                        },
                        child: const Text("草"),
                      )
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
  }
}
