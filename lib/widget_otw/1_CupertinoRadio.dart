import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoRadioPage extends StatefulWidget {
  const CupertinoRadioPage({super.key});

  @override
  State<CupertinoRadioPage> createState() => _CupertinoRadioPageState();
}

class _CupertinoRadioPageState extends State<CupertinoRadioPage> {
  Animals _selectedValue = Animals.dog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('1. CupertinoRadio'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoListTile(
              title: Text('dog'),
              leading: CupertinoRadio<Animals>(
                value: Animals.dog,
                groupValue: _selectedValue,
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                },
              ),
            ),
            CupertinoListTile(
              title: Text('pig'),
              leading: CupertinoRadio<Animals>(
                value: Animals.pig,
                groupValue: _selectedValue,
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                },
              ),
            ),
            CupertinoListTile(
              title: Text("bird"),
              leading: CupertinoRadio<Animals>(
                value: Animals.bird,
                groupValue: _selectedValue,
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                },
              ),
            ),
          ],
        )));
  }
}

enum Animals {
  dog,
  pig,
  bird;
}
