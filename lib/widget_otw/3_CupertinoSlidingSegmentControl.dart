import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// segmentcontrol
class CupertinoSlidingSegmentedControlPage extends StatefulWidget {
  const CupertinoSlidingSegmentedControlPage({super.key});

  @override
  State<CupertinoSlidingSegmentedControlPage> createState() =>
      _CupertinoSlidingSegmentedControlPageState();
}

class _CupertinoSlidingSegmentedControlPageState
    extends State<CupertinoSlidingSegmentedControlPage> {
  int? _selectedSegment = 0;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("3. Cupertino Sliding Segmented Control"),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 80,
              child: CupertinoSlidingSegmentedControl(
                children: {
                  0: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(CupertinoIcons.home, size: 20),
                        SizedBox(
                          height: 2,
                        ),
                        DefaultTextStyle(
                            style: TextStyle(fontSize: 12, color: Colors.black),
                            child: Text('Home')),
                      ],
                    ),
                  ),
                  1: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          CupertinoIcons.search,
                          size: 20,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        DefaultTextStyle(
                            style: TextStyle(fontSize: 12, color: Colors.black),
                            child: Text('Search')),
                      ],
                    ),
                  ),
                  2: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(CupertinoIcons.person, size: 20),
                        SizedBox(
                          height: 2,
                        ),
                        DefaultTextStyle(
                            style: TextStyle(fontSize: 12, color: Colors.black),
                            child: Text('Person')),
                      ],
                    ),
                  ),
                },
                groupValue: _selectedSegment,
                onValueChanged: (int? newValue) {
                  setState(() {
                    _selectedSegment = newValue;
                  });
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            DefaultTextStyle(
                style: TextStyle(fontSize: 30, color: Colors.black),
                child: Text(
                    'Selected: ${_selectedSegment == 0 ? "home" : _selectedSegment == 1 ? "search" : "person"}')),
          ],
        )));
  }
}
