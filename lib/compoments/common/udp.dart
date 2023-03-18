import 'package:demo/compoments/common/log.dart';
import 'package:udp/udp.dart';

class Udp {
  // 端口
  static int port = 60000;

  static void send(String msg) async {
    var sender = await UDP.bind(Endpoint.any());
    await sender.send(_hexMsg(msg), Endpoint.broadcast(port: Port(port)));
    Log.info("发送消息 $msg 到 $port 端口");
    sender.close();
  }

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
