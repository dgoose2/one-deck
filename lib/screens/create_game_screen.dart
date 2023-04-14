import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uno/screens/create_user_screen.dart';
import 'package:uno/style/custom_colors.dart';
import 'package:uno/style/text_style.dart';

const String SERVICE_UUID = "4fafc201-1fb5-459e-8fcc-c5c9c331914b";
const String CHARACTERISTIC_UUID = "beb5483e-36e1-4688-b7f5-ea07361b26a8";
const String TARGET_DEVICE_NAME = "Grissoms M5Core2";

class CreateGameScreen extends StatefulWidget {
  static const routeName = '/create-game-screen';

  const CreateGameScreen({super.key});

  @override
  State<CreateGameScreen> createState() => _CreateGameScreenState();
}

class _CreateGameScreenState extends State<CreateGameScreen> {
  double turns = 0;
  double turns2 = 0;
  bool selected = false;

  final _bleDeviceController = TextEditingController()
    ..text = TARGET_DEVICE_NAME;

  FlutterBlue flutterBlue = FlutterBlue.instance;
  late StreamSubscription<ScanResult> scanSubscription;
  late BluetoothDevice targetDevice;
  late BluetoothCharacteristic targetCharacteristic;

  String bleStatus = "No Connection";
  String deviceStatus = "none";
  String bleLastRead = "N/A";
  bool targetDeviceFound = false;
  bool isConnectedToTarget = false;
  String btnConnectionText = "Connect";

  _startScan() async {
    setState(() => bleStatus = "Scanning available BLE devices...");
    bool returnValue = false;

    // Start scan
    scanSubscription = flutterBlue
        .scan(timeout: const Duration(seconds: 10))
        .listen((scanResult) {
      if (scanResult.device.name == _bleDeviceController.text) {
        setState(() {
          deviceStatus = "connecting";
          targetDevice = scanResult.device;
          // bleStatus = "Found ${targetDevice.name}";
          targetDeviceFound = true;
          btnConnectionText = "Connect";
        });
        scanSubscription.cancel();
      }
    }, onDone: () {
      _stopScan();
    });
  }

  _stopScan() {
    scanSubscription.cancel();
    setState(() => bleStatus = "${_bleDeviceController.text} not found");
  }

  _connectToDevice() async {
    await targetDevice.connect();
    await _discoverServices();
    setState(() => bleStatus = "connected");
    setState(() {
      isConnectedToTarget = true;
      btnConnectionText = "Disconnect";
    });
  }

  _discoverServices() async {
    List<BluetoothService> services = await targetDevice.discoverServices();
    for (var service in services) {
      if (service.uuid.toString() == SERVICE_UUID) {
        for (var characteristic in service.characteristics) {
          if (characteristic.uuid.toString() == CHARACTERISTIC_UUID) {
            targetCharacteristic = characteristic;
            print("Character: ${characteristic}");
            await targetCharacteristic.setNotifyValue(true);
          }
        }
      }
    }
  }

  _writeData(String data) async {
    List<int> bytes = utf8.encode(data);
    await targetCharacteristic.write(bytes);
  }

  _readData() async {
    List<int> bytes = await targetCharacteristic.read();
    print(utf8.decode(bytes));
    setState(() => bleLastRead = utf8.decode(bytes));
    //setState(() => bleLastRead = "$bytes");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (isConnectedToTarget) {
      print('connected');

      targetCharacteristic.value.listen((value) {
        // _updateGlobalData(value);
        _readData();
        print("Value from Jake: ${bleLastRead}");
      });
    }
  }

  void moveUp() {
    setState(() {
      selected = !selected;
      turns -= 0.04;
      turns2 += 0.028;
    });
  }

  void moveDown() {
    setState(() {
      selected = !selected;
      turns += 0.04;
      turns2 -= 0.028;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.dark,
      body: Column(
        children: [
          Container(
            height: 900,
            width: double.infinity,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                AnimatedPositioned(
                  duration: Duration(seconds: 1),
                  top: selected ? 100.0 : 400.0,
                  left: MediaQuery.of(context).size.width * 0.1,
                  child: GestureDetector(
                    onTap: () {
                      moveDown();
                    },
                    child: Container(
                      width: 326,
                      child: Text(
                        !selected
                            ? 'Power on onedeck companion'
                            : 'connect device',
                        style: TextStyles().font1(
                          CustomColors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(seconds: 1),
                  top: selected ? 250.0 : 750.0,
                  left: 85,
                  child: GestureDetector(
                    onTap: () async {
                      !selected ? moveUp() : await _startScan();
                      Future.delayed(const Duration(seconds: 3), () {
                        print(deviceStatus);
                        if (deviceStatus == 'connecting') {
                          Future.delayed(const Duration(seconds: 3), () async {
                            await _connectToDevice();
                            Future.delayed(const Duration(seconds: 3), () {
                              print(bleStatus);
                              if (bleStatus == 'connected') {
                                Navigator.of(context)
                                    .pushNamed(CreateUserScreen.routeName);
                              }
                            });
                          });
                        }
                      });

                      // Navigator.of(context)
                      //     .pushNamed(CreateUserScreen.routeName);
                    },
                    child: Image.asset(
                      'assets/images/connect-device.png',
                      height: 300,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
