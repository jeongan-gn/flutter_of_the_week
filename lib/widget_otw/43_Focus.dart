import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FocusPage extends StatefulWidget {
  const FocusPage({super.key});

  @override
  State<FocusPage> createState() => _FocusState();
}

class _FocusState extends State<FocusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("43. Focus")),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[MyCustomWidget(), MyCustomWidget()],
      ),
    );
  }
}

class MyCustomWidget extends StatefulWidget {
  const MyCustomWidget({super.key});

  @override
  State<MyCustomWidget> createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  Color _color = Colors.white;
  String _label = 'Unfocused';
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose(); // 메모리 누수 방지
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _focusNode,
      onFocusChange: (focused) {
        setState(() {
          _color = focused ? Colors.black26 : Colors.white;
          _label = focused ? 'Focused' : 'Unfocused';
        });
      },
      child: GestureDetector(
        onTap: () {
          _focusNode.requestFocus();
        },
        child: Center(
          child: Container(
            width: 300,
            height: 50,
            alignment: Alignment.center,
            color: _color,
            child: Text(_label),
          ),
        ),
      ),
    );
  }
}
