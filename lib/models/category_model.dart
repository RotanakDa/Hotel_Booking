import 'package:flutter/material.dart';

class CategoryModel{
  String name;
  String subText;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.subText,
    required this.iconPath,
    required this.boxColor
});

  static List<CategoryModel> getCategories(){
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
          name: 'Kanto',
          subText: 'Gen 1',
          iconPath: 'assets/images/Pokeball.png',
          boxColor: Colors.red
      )
    );

    categories.add(
        CategoryModel(
            name: 'Johto',
            subText: 'Gen 2',
            iconPath: 'assets/images/Pokeball.png',
            boxColor: Colors.yellow
        )
    );

    categories.add(
        CategoryModel(
            name: 'Hoenn',
            subText: 'Gen 3',
            iconPath: 'assets/images/Pokeball.png',
            boxColor: Colors.blue
        )
    );

    categories.add(
        CategoryModel(
            name: 'Sinnoh',
            subText: 'Gen 4',
            iconPath: 'assets/images/Pokeball.png',
            boxColor: Colors.teal
        )
    );

    categories.add(
        CategoryModel(
            name: 'Unova',
            subText: 'Gen 5',
            iconPath: 'assets/images/Pokeball.png',
            boxColor: Colors.amber
        )
    );

    categories.add(
        CategoryModel(
            name: 'Kalos',
            subText: 'Gen 6',
            iconPath: 'assets/images/Pokeball.png',
            boxColor: Colors.cyanAccent
        )
    );

    categories.add(
        CategoryModel(
            name: 'Alola',
            subText: 'Gen 7',
            iconPath: 'assets/images/Pokeball.png',
            boxColor: Colors.greenAccent
        )
    );

    categories.add(
        CategoryModel(
            name: 'Galar',
            subText: 'Gen 8',
            iconPath: 'assets/images/Pokeball.png',
            boxColor: Colors.purpleAccent
        )
    );

    categories.add(
        CategoryModel(
            name: 'Paldea',
            subText: 'Gen 9',
            iconPath: 'assets/images/Pokeball.png',
            boxColor: Colors.blueGrey
        )
    );

    return categories;
  }

}