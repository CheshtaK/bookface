import 'package:bookface/constants/images.dart';
import 'package:bookface/constants/strings.dart';
import 'package:flutter/material.dart';

class CategoryItem {
  String image;
  String text;
  Color color;

  CategoryItem({this.image, this.text, this.color});
}

List<CategoryItem> categoryList = [
  CategoryItem(
      image: Images.art_and_music,
      text: Strings.art_and_music,
      color: Colors.transparent),
  CategoryItem(
      image: Images.comic, text: Strings.comic, color: Colors.transparent),
  CategoryItem(
      image: Images.computer_and_tech,
      text: Strings.computer_and_tech,
      color: Colors.transparent),
  CategoryItem(
      image: Images.cooking, text: Strings.cooking, color: Colors.transparent),
  CategoryItem(
      image: Images.health_and_fitness,
      text: Strings.health_and_fitness,
      color: Colors.transparent),
  CategoryItem(
      image: Images.romance, text: Strings.romance, color: Colors.transparent),
  CategoryItem(
      image: Images.mystery, text: Strings.mystery, color: Colors.transparent),
  CategoryItem(
      image: Images.travel, text: Strings.travel, color: Colors.transparent),
];
