import 'package:bookface/widgets/bottom_navigation_items.dart';
import 'package:bookface/widgets/bottom_navigation_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _currentIndex,
          children: allItems.map<Widget>((BottomNavigationItem item) {
            return BottomNavigationView(item: item);
          }).toList(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: allItems.map((BottomNavigationItem item) {
          return BottomNavigationBarItem(
              icon: Icon(item.icon),
              backgroundColor: item.color,
              title: Text(item.title));
        }).toList(),
      ),
    );
  }
}
