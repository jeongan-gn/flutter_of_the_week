import 'package:flutter/material.dart';

class MediaQueryPropertyOfPage extends StatefulWidget {
  const MediaQueryPropertyOfPage({super.key});

  @override
  State<MediaQueryPropertyOfPage> createState() => _MediaQueryPropertyOfState();
}

class _MediaQueryPropertyOfState extends State<MediaQueryPropertyOfPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var orientation = MediaQuery.of(context).orientation;
    var padding = MediaQuery.of(context).padding;
    var accessibility = MediaQuery.of(context).accessibleNavigation;
    var deviceRatio = MediaQuery.of(context).devicePixelRatio;
    var brightness = MediaQuery.of(context).platformBrightness;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(title: Text("8. MediaQueryProperty")),
      body: Column(
        children: [
          Container(
            color: Colors.red,
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width / 2,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'MediaQuery Info',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                      "${screenSize.width.toStringAsFixed(0)} × ${screenSize.height.toStringAsFixed(0)} px"),
                  Text(orientation == Orientation.portrait
                      ? "세로 (Portrait)"
                      : "가로 (Landscape)"),
                  Text(
                    "padding: "
                    "상: ${padding.top.toStringAsFixed(0)}, "
                    "하: ${padding.bottom.toStringAsFixed(0)}, "
                    "좌: ${padding.left.toStringAsFixed(0)}, "
                    "우: ${padding.right.toStringAsFixed(0)}",
                  ),
                  Text("accessibility navigation: ${accessibility}"),
                  Text("deviceRatio: ${deviceRatio}"),
                  Text(
                      "brightness: ${brightness == Brightness.dark ? 'dark' : 'light'}"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
