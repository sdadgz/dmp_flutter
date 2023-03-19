import 'dart:io';

import 'package:demo/components/common/log.dart';
import 'package:udp/udp.dart';

class Udp {
  // 端口
  static int targetPort = 60000; // 目标端口
  static int receiverPort = 3000; // 接收端口

  // 广播发送信息
  static void broadcastHex(String msg) async {
    var sender = await UDP.bind(Endpoint.any(port: Port(receiverPort)));
    await sender.send(_hexMsg(msg), Endpoint.broadcast(port: Port(targetPort)));
    Log.info("广播消息 $msg 到 $targetPort 端口");
    sender.close();
  }

  // 发送信息
  static void sendHex(String msg, InternetAddress address, int port) async {
    var sender = await UDP.bind(Endpoint.any(port: Port(receiverPort)));
    await sender.send(
      _hexMsg(msg),
      Endpoint.unicast(address, port: Port(port)),
    );
    Log.info("发送消息 $msg 到 ${address.address} 的 $targetPort 端口");
    sender.close();
  }

  // 接收信息
  static void receive(Function callback) {
    Log.info("开始接收udp数据");

    RawDatagramSocket.bind(InternetAddress.anyIPv4, receiverPort)
        .then((RawDatagramSocket udpSocket) {
      udpSocket.broadcastEnabled = true;
      udpSocket.listen((e) {
        Datagram? dg = udpSocket.receive();
        if (dg != null) {
          Log.info("udp received ${String.fromCharCodes(dg.data)}");
          callback(String.fromCharCodes(dg.data), dg.address, dg.port);
        }
      });
    });
  }

  // 转16进制数组
  static List<int> _hexMsg(String msg) {
    List<int> res = [];
    // 去非法数据
    RegExp regExp = RegExp(r'([a-fA-F\d]{2})');
    Iterable<RegExpMatch> r = regExp.allMatches(msg);

    for (final element in r) {
      var parse = int.parse(element[0]!, radix: 16);
      res.add(parse);
    }

    return res;
  }
}
