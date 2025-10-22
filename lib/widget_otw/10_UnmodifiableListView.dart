import 'dart:collection';

import 'package:flutter/material.dart';

class UnmodifiableListViewPage extends StatefulWidget {
  const UnmodifiableListViewPage({super.key});

  @override
  State<UnmodifiableListViewPage> createState() => _UnmodifiableListViewState();
}

class _UnmodifiableListViewState extends State<UnmodifiableListViewPage> {
  @override
  Widget build(BuildContext context) {
    final model = AnimalsModel();
    return Scaffold(
        appBar: AppBar(title: Text("10. UnmodifiableListView")),
        body: Center(
          child: Column(
            children: [
              Text("Animals", style: TextStyle(fontSize: 30)),
              for (var animal in model.animals)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    Icon(
                      Icons.circle,
                      size: 10,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(animal, style: TextStyle(fontSize: 20)),
                  ],
                )
            ],
          ),
        ));
  }
}

class AnimalsModel {
  final _animals = ['dog', 'cat', 'pig', 'cow'];
  UnmodifiableListView<String> get animals => UnmodifiableListView(_animals);

  List<String> get animalList => _animals;
}
