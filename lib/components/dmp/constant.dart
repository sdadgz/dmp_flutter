const String startMsg = "aa55010000bb66"; // 开始
const String pauseMsg = "aa55010001bb66"; // 暂停

const String numberOutOfPortErrorText = "端口号应在1-65535范围内";

// 等速模式
List<DevicesMod> constantVelocityModMap = [
  DevicesMod(msg: "aa55010000bb66", label: "开始运动"),
  DevicesMod(msg: "aa55010001bb66", label: "停止运动"),
  DevicesMod(msg: "aa55010002bb66", label: "结束运动"),
  DevicesMod(msg: "aa55010100bb66", label: "速度加"),
  DevicesMod(msg: "aa55010101bb66", label: "速度减"),
];

// 被动模式
List<DevicesMod> passiveModMap = [
  DevicesMod(msg: "aa55020000bb66", label: "开始运动"),
  DevicesMod(msg: "aa55020001bb66", label: "开始运动"),
  DevicesMod(msg: "aa55020002bb66", label: "开始运动"),
  DevicesMod(msg: "aa55020100bb66", label: "开始运动"),
  DevicesMod(msg: "aa55020101bb66", label: "开始运动"),
  // 最后一个设置训练时间不在这里
];

// 主动模式
List<DevicesMod> activeModMap = [
  DevicesMod(msg: "aa55030000bb66", label: "建设中"),
];

// 设备模式
class DevicesMod {
  DevicesMod({required this.msg, required this.label});

  final String msg;
  final String label;
}
