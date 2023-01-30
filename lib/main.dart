import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("E")),
        body: Center(child: Text("H")),
        bottomNavigationBar: CupertinoTabBarExample(),
      )
      
    );
  }
}


enum TabItem { favorites, recents, contacts, keypad }
class CupertinoTabBarExample extends StatelessWidget {
  const CupertinoTabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
     tabBar: CupertinoTabBar(
        items: List.generate(TabItem.values.length, (int index) {
          final item = TabItem.values[index];
          switch (item) {
            case TabItem.favorites:
              return BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.star_fill),
                label: 'Favorites',
              );
            case TabItem.recents:
              return BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.clock_solid),
                label: 'Recents',
              );
            case TabItem.contacts:
              return BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person_alt_circle_fill),
                label: 'Contacts',
              );
            case TabItem.keypad:
              return BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.circle_grid_3x3_fill),
                label: 'Keypad',
              );
          }
        }),
      ),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (BuildContext context) {
                return Center(
                  child: Text('첫번째 페이지'),
                );
              },
            );
          case 1:
            return CupertinoTabView(
              builder: (BuildContext context) {
                return Center(
                  child: Text('두번째 페이지'),
                );
              },
            );
          // And so on for the other tabs
          default:
            return CupertinoTabView(
              builder: (BuildContext context) {
                return Center(
                  child: Text('Content of tab $index'),
                );
              },
            );
        }
      },
    );
  }
}