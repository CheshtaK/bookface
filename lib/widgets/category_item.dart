import 'package:flutter/material.dart';

class CategoryItem {
  String image;
  String text;
  Color color;

  CategoryItem({this.image, this.text, this.color});
}

List<CategoryItem> categoryList = [
  CategoryItem(
      image: 'assets/art_and_music.jpg',
      text: "Arts & Music",
      color: Colors.transparent),
  CategoryItem(
      image: 'assets/comic.jpg', text: "Comics", color: Colors.transparent),
  CategoryItem(
      image: 'assets/computer_and_tech.jpg',
      text: "Computers and Tech",
      color: Colors.transparent),
  CategoryItem(
      image: 'assets/cooking.jpg', text: "Cooking", color: Colors.transparent),
  CategoryItem(
      image: 'assets/health_and_fitness.jpg',
      text: "Health & Fitness",
      color: Colors.transparent),
  CategoryItem(
      image: 'assets/romance.jpg', text: "Romance", color: Colors.transparent),
  CategoryItem(
      image: 'assets/mystery.jpg', text: "Mystery", color: Colors.transparent),
  CategoryItem(
      image: 'assets/travel.jpg', text: "Travel", color: Colors.transparent),
];
