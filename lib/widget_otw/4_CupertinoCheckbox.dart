import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoCheckboxPage extends StatefulWidget {
  const CupertinoCheckboxPage({super.key});

  @override
  State<CupertinoCheckboxPage> createState() => _CupertinoCheckboxPageState();
}

class _CupertinoCheckboxPageState extends State<CupertinoCheckboxPage> {
  List<bool> items = [false, false, false, false];
  List<Color> colors = [
    CupertinoColors.systemGreen,
    CupertinoColors.systemPurple,
    CupertinoColors.systemBrown,
    CupertinoColors.systemRed
  ];
  bool? get allSelected {
    if (items.every((item) => item)) {
      return true; // 모두 선택
    } else if (items.every((item) => !item)) {
      return false; // 모두 해제
    } else {
      return null; // 일부 선택
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("4. CupertinoCheckbox"),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(children: [
                    CupertinoCheckbox(
                        value: allSelected,
                        activeColor: CupertinoColors.systemOrange,
                        tristate: true,
                        onChanged: (bool? value) {
                          setState(() {
                            items = List.filled(items.length, value ?? false);
                          });
                        }),
                    SizedBox(
                      width: 12,
                    ),
                    DefaultTextStyle(
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        child: Text('Select All')),
                  ])),
              Divider(),
              ...List.generate(items.length, (index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                  child: Row(
                    children: [
                      CupertinoCheckbox(
                          value: items[index],
                          activeColor: colors[index],
                          onChanged: (bool? value) {
                            setState(() {
                              items[index] = value ?? false;
                            });
                          }),
                      SizedBox(
                        width: 12,
                      ),
                      DefaultTextStyle(
                          style: TextStyle(fontSize: 17, color: Colors.black),
                          child: Text('Item ${index + 1}')),
                    ],
                  ),
                );
              })
            ],
          ),
        ));
  }
}
