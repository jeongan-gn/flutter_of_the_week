import 'package:flutter/material.dart';

class RawMagnifierPage extends StatefulWidget {
  const RawMagnifierPage({super.key});

  @override
  State<RawMagnifierPage> createState() => _RawMagnifierState();
}

class _RawMagnifierState extends State<RawMagnifierPage> {
  static const double magnifierRadius = 50.0;
  Offset dragGesturePosition = const Offset(100, 100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("34. RawMagnifier")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Drag on the logo!'),
            RepaintBoundary(
                child: Stack(
              children: <Widget>[
                GestureDetector(
                  onPanUpdate: (DragUpdateDetails details) => setState(() {
                    dragGesturePosition = details.localPosition;
                  }),
                  onPanDown: (DragDownDetails details) => setState(() {
                    dragGesturePosition = details.localPosition;
                  }),
                  child: const FlutterLogo(size: 300),
                ),
                Positioned(
                  left: dragGesturePosition.dx - magnifierRadius,
                  top: dragGesturePosition.dy - magnifierRadius,
                  child: const RawMagnifier(
                    decoration: MagnifierDecoration(
                      shape: CircleBorder(
                          side: BorderSide(color: Colors.pink, width: 3)),
                    ),
                    size: Size(magnifierRadius * 2, magnifierRadius * 2),
                    magnificationScale: 2,
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
