import 'package:flutter/material.dart';

class DraggablePage extends StatefulWidget {
  const DraggablePage({super.key});

  @override
  State<DraggablePage> createState() => _DraggableState();
}

class _DraggableState extends State<DraggablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("29. Draggable")),
      body: const DraggableExample(),
    );
  }
}

class DraggableExample extends StatefulWidget {
  const DraggableExample({super.key});

  @override
  State<DraggableExample> createState() => _DraggableExampleState();
}

class _DraggableExampleState extends State<DraggableExample> {
  int acceptedData = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Draggable<int>(
          data: 10,
          feedback: Container(
            color: Colors.deepOrange,
            height: 100,
            width: 100,
            child: const Icon(Icons.directions_run),
          ),
          childWhenDragging: Container(
            height: 100,
            width: 100,
            color: Colors.pinkAccent,
            child: const Center(child: Text('Child When Dragging')),
          ),
          child: Container(
            height: 100,
            width: 100,
            color: Colors.lightGreenAccent,
            child: const Center(child: Text('Draggable')),
          ),
        ),
        DragTarget<int>(
          builder: (BuildContext context, List<dynamic> accepted,
              List<dynamic> rejected) {
            return Container(
              height: 100,
              width: 100,
              color: Colors.cyan,
              child: Center(child: Text('Value is updated to: $acceptedData')),
            );
          },
          onAcceptWithDetails: (DragTargetDetails<int> details) {
            setState(() {
              acceptedData += details.data;
            });
          },
        )
      ],
    );
  }
}
