import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// modal view
class CupertinoSheetRoutePage extends StatefulWidget {
  const CupertinoSheetRoutePage({super.key});

  @override
  State<CupertinoSheetRoutePage> createState() =>
      _CupertinoSheetRoutePageState();
}

class _CupertinoSheetRoutePageState extends State<CupertinoSheetRoutePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" 2. CupertinoSheetRoute"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CupertinoButton(
            color: CupertinoColors.activeBlue,
            onPressed: () {
              // Modal로 Present
              showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return SecondSheetScreen();
                },
              );
            },
            child: const Text("Modal Present"),
          ),
          const SizedBox(height: 20),
          CupertinoButton(
            color: CupertinoColors.activeGreen,
            onPressed: () {
              // Navigate Push
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => SecondSheetScreen(),
                ),
              );
            },
            child: const Text("Navigate Push"),
          )
        ],
      )),
    );
  }
}

class SecondSheetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Second Screen"),
      ),
      child: Center(
        child: CupertinoButton(
          child: const Text("Back"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
