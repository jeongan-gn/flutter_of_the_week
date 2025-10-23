import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FutureBuilderPage extends StatefulWidget {
  final String title;

  const FutureBuilderPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<FutureBuilderPage> createState() => _FutureBuilderState();
}

class _FutureBuilderState extends State<FutureBuilderPage> {
  Future<dynamic>? _myData;
  @override
  initState() {
    super.initState();
    _myData = http.get(
        Uri.parse('https://my-json-server.typicode.com/typicode/demo/profile'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("39. FutureBuilder"),
        ),
        body: DefaultTextStyle(
            style: Theme.of(context).textTheme.headlineMedium!,
            child: FutureBuilder<dynamic>(
                future: _myData,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  List<Widget> children;
                  if (snapshot.hasData) {
                    String name =
                        Profile.fromJson(jsonDecode(snapshot.data.body)).name;
                    children = <Widget>[
                      const Icon(Icons.check_circle_outline,
                          color: Colors.green, size: 60),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text('Result: $name'),
                      ),
                    ];
                  } else if (snapshot.hasError) {
                    children = <Widget>[
                      const Icon(Icons.error_outline,
                          color: Colors.red, size: 60),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text('Error: ${snapshot.error}'),
                      ),
                    ];
                  } else {
                    children = const <Widget>[
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(),
                      ),
                    ];
                  }
                  return Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: children,
                  ));
                })));
  }
}

class Profile {
  final String name;
  const Profile({required this.name});
  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(name: json['name']);
  }
}
