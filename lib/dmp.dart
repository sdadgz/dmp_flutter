import 'package:demo/compoments/common/dmp_button.dart';
import 'package:demo/compoments/common/log.dart';
import 'package:flutter/material.dart';

const startMsg = "aa550000bb66"; // 开始
const pauseMsg = "aa550001bb66"; // 暂停

class Dmp extends StatelessWidget {
  const Dmp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UdpButtonFul(
            label: "开始",
            msg: startMsg,
            callback: () {
              Log.info("点击开始");
            },
          ),
          UdpButtonFul(
              label: "暂停",
              callback: () {
                Log.info("点击暂停");
              },
              msg: pauseMsg)
        ],
      ),
    );
  }
}
