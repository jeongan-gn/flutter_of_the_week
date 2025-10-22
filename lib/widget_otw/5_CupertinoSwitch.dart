import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoSwitchPage extends StatefulWidget {
  const CupertinoSwitchPage({super.key});

  @override
  State<CupertinoSwitchPage> createState() => _CupertinoSwitchPageState();
}

class _CupertinoSwitchPageState extends State<CupertinoSwitchPage> {
  bool wifiEnabled = true;
  bool bluetoothEnabled = false;
  bool airplaneModeEnabled = false;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("5. CupertinoSwitch"),
        ),
        child: ListView(
          children: [
            Row(
              children: [
                CupertinoSwitch(
                    value: wifiEnabled,
                    onChanged: (bool value) {
                      setState(() {
                        wifiEnabled = value;
                      });
                    }),
                DefaultTextStyle(
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    child: Text('wifi')),
              ],
            ),
            Row(
              children: [
                CupertinoSwitch(
                    value: bluetoothEnabled,
                    onChanged: (bool value) {
                      setState(() {
                        bluetoothEnabled = value;
                      });
                    }),
                DefaultTextStyle(
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    child: Text('bluetooth')),
              ],
            ),
            Row(
              children: [
                CupertinoSwitch(
                    value: airplaneModeEnabled,
                    onChanged: (bool value) {
                      setState(() {
                        airplaneModeEnabled = value;
                      });
                    }),
                DefaultTextStyle(
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    child: Text('airplaneMode')),
              ],
            ),
            Row(
              children: [
                CupertinoSwitch(
                    value: notificationsEnabled,
                    onChanged: (bool value) {
                      setState(() {
                        notificationsEnabled = value;
                      });
                    }),
                DefaultTextStyle(
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    child: Text('notification')),
              ],
            )
          ],
        ));
  }
}
