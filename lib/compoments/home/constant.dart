// 设备名字表
Map<int, String> _devicesNameMap = {
  0: "测试用虚拟",
};

// 设备状态表
Map<int, String> _devicesStateMap = {
  0: "关闭",
  1: "开启",
  2: "错误",
};

// 获取设备名
String getDevicesName(int devicesCode) {
  return _devicesNameMap[devicesCode] ?? "未注册设备";
}

// 获取设备状态
String getDevicesState(int stateCode) {
  return _devicesStateMap[stateCode] ?? "未知状态";
}

// 设备
class Devices {
  int nameCode = 0;
  int state = 0;
  String serialNumber = "44d402b4-b797-4071-9a0e-701f035fbe3e";
}
