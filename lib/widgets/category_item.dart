import 'package:bookface/constants/images.dart';
import 'package:bookface/constants/strings.dart';

class CategoryItem {
  final String image;
  final String text;

  const CategoryItem(this.image, this.text);
}

const List<CategoryItem> categoryList = <CategoryItem>[
  CategoryItem(Images.action_and_adventure, Strings.action_and_adventure),
  CategoryItem(Images.art_and_music, Strings.art_and_music),
  CategoryItem(
      Images.biography_and_autobiography, Strings.biography_and_autobiography),
  CategoryItem(Images.classics, Strings.classics),
  CategoryItem(Images.comic, Strings.comic),
  CategoryItem(Images.computer_and_tech, Strings.computer_and_tech),
  CategoryItem(Images.cookbooks, Strings.cookbooks),
  CategoryItem(Images.health_and_fitness, Strings.health_and_fitness),
  CategoryItem(Images.literary, Strings.literary),
  CategoryItem(Images.mystery, Strings.mystery),
  CategoryItem(Images.memoir, Strings.memoir),
  CategoryItem(Images.romance, Strings.romance),
  CategoryItem(Images.travel, Strings.travel),
  CategoryItem(Images.historical_fiction, Strings.historical_fiction),
  CategoryItem(Images.history, Strings.history),
  CategoryItem(Images.horror, Strings.horror),
  CategoryItem(Images.self_help, Strings.self_help),
  CategoryItem(Images.suspense_and_thriller, Strings.suspense_and_thriller),
  CategoryItem(Images.true_crime, Strings.true_crime),
  CategoryItem(Images.women_fiction, Strings.women_fiction),
];
