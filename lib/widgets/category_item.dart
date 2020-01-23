import 'package:bookface/constants/images.dart';
import 'package:bookface/constants/strings.dart';

class CategoryItem {
  final String image;
  final String text;

  const CategoryItem(this.image, this.text);
}

const List<CategoryItem> categoryList = <CategoryItem>[
  CategoryItem(Images.art_and_music, Strings.art_and_music),
  CategoryItem(Images.comic, Strings.comic),
  CategoryItem(Images.computer_and_tech, Strings.computer_and_tech),
  CategoryItem(Images.cooking, Strings.cooking),
  CategoryItem(Images.health_and_fitness, Strings.health_and_fitness),
  CategoryItem(Images.romance, Strings.romance),
  CategoryItem(Images.mystery, Strings.mystery),
  CategoryItem(Images.travel, Strings.travel),
];
