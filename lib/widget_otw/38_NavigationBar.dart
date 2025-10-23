import 'package:flutter/material.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({super.key});

  @override
  State<NavigationBarPage> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBarPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("38. NavigationBar")),
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(microseconds: 1000),
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.explore), label: 'Explore'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
          NavigationDestination(
              icon: Icon(Icons.settings_rounded), label: 'Settings'),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
      ),
      body: <Widget>[
        Container(
          color: Colors.lightBlue,
          alignment: Alignment.center,
          child: const Text('Blue'),
        ),
        Container(
          color: Colors.orange,
          alignment: Alignment.center,
          child: const Text('Orange'),
        ),
        Container(
          color: Colors.pink,
          alignment: Alignment.center,
          child: const Text('Pink'),
        ),
        Container(
          color: Colors.purple,
          alignment: Alignment.center,
          child: const Text('Purple'),
        ),
      ][currentPageIndex],
    );
  }
}
