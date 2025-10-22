import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:typed_data';

class Uint8ListPage extends StatefulWidget {
  const Uint8ListPage({super.key});

  @override
  State<Uint8ListPage> createState() => _Uint8ListState();
}

class _Uint8ListState extends State<Uint8ListPage> {
  String text = "Hello";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("11. Uint8List")),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              children: [
                Text(
                    "Flutter Uses Uint8List for handling Data(of Image, File, NetworkData, Byte-Stream)"),
                Text("Uint8List: Unsigned Integer 8-List"),
                Text("which represents bytes"),
                Text("0 ~ 255 Int(byte) number"),
                Divider(),
                Text("| Char | UTF-8 Bytes | Uint8List |"),
                for (var char in text.characters)
                  Text(
                      "| '$char' | ${utf8.encode(char)} | ${Uint8List.fromList(utf8.encode(char))} |")
              ],
            ),
          ),
        ));
  }
}
