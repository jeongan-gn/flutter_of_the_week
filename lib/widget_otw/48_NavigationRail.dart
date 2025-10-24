import 'package:flutter/material.dart';

class NavigationRailPage extends StatefulWidget {
  const NavigationRailPage({super.key});

  @override
  State<NavigationRailPage> createState() => _NavigationRailState();
}

class _NavigationRailState extends State<NavigationRailPage> {
  int _selectedIndex = 0;
  void changeDestination(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth <= 730) {
        return Scaffold(
            appBar: AppBar(title: Text("48. NavigationRail")),
            body: Row(
              children: <Widget>[
                NavigationRail(
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: changeDestination,
                  minWidth: 100,
                  labelType: NavigationRailLabelType.all,
                  selectedIconTheme: const IconThemeData(color: Colors.white),
                  selectedLabelTextStyle:
                      TextStyle(color: Colors.lightBlue[500]),
                  unselectedLabelTextStyle: TextStyle(color: Colors.grey[500]),
                  elevation: 5,
                  useIndicator: true,
                  backgroundColor: Colors.grey[50],
                  indicatorColor: Colors.cyan[50],
                  destinations: const <NavigationRailDestination>[
                    NavigationRailDestination(
                      icon: Icon(Icons.house_outlined),
                      selectedIcon: Icon(Icons.home),
                      label: Text("Home"),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.star_border),
                      selectedIcon: Icon(Icons.star),
                      label: Text("Favorites"),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.account_circle_outlined),
                      selectedIcon: Icon(Icons.account_circle),
                      label: Text("Profile"),
                    )
                  ],
                ),
                const VerticalDivider(thickness: 1, width: 1),
                Expanded(
                    child: Center(
                  child: Text("selectedIndex: $_selectedIndex"),
                ))
              ],
            ));
      }
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: "Profile",
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: changeDestination,
        ),
        body: Center(
          child: Text("SelectedIndex: $_selectedIndex"),
        ),
      );
    });
  }
}
