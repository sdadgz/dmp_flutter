import 'package:demo/compoments/common/log.dart';
import 'package:udp/udp.dart';

class Udp {
  static void send(String msg) async {
    var sender = await UDP.bind(Endpoint.any());
    await sender.send(
        _hexMsg(msg), Endpoint.broadcast(port: const Port(60000)));
    sender.close();
  }

  static List<int> _hexMsg(String msg) {
    List<int> res = [];
    // 去非法数据
    RegExp regExp = RegExp(r'([a-fA-F0-9]{2})');
    Iterable<RegExpMatch> r = regExp.allMatches(msg);

    for (final element in r) {
      var parse = int.parse(element[0]!, radix: 16);
      res.add(parse);
    }

    return res;
  }
}
