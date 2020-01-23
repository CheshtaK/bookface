import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationItem {
  const BottomNavigationItem(this.title, this.icon, this.color);

  final String title;
  final IconData icon;
  final MaterialColor color;
}

const List<BottomNavigationItem> allItems = <BottomNavigationItem>[
  BottomNavigationItem('Explore', Icons.search, Colors.teal),
  BottomNavigationItem('Saved', Icons.favorite_border, Colors.cyan),
  BottomNavigationItem('Posts', Icons.add_comment, Colors.orange),
  BottomNavigationItem('Inbox', Icons.chat_bubble_outline, Colors.blue),
  BottomNavigationItem('Profile', Icons.person_outline, Colors.blue)
];
