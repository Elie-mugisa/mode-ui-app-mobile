import 'package:flutter/material.dart';

class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  Color boxColors;
  bool viewIsSelected;

  DietModel(
      {required this.name,
      required this.iconPath,
      required this.level,
      required this.duration,
      required this.calorie,
      required this.viewIsSelected,
      required this.boxColors});

  static List<DietModel> getDiets() {
    List<DietModel> diets = [
      DietModel(
          name: "Honey Cake",
          iconPath: "assets/images/cake.svg",
          level: "Easy",
          duration: "30mins",
          calorie: "180kcal",
          boxColors: const Color.fromARGB(255, 146, 253, 166),
          viewIsSelected: true),
      DietModel(
          name: "Tomato Pizza",
          iconPath: "assets/images/pizza.svg",
          level: "A bit easy",
          duration: "45mins",
          calorie: "110kcal",
          boxColors: const Color.fromARGB(255, 216, 255, 168),
          viewIsSelected: false),
      DietModel(
          name: "Honey pancake",
          iconPath: "assets/images/cake.svg",
          level: "Hard",
          duration: "1h30mins",
          calorie: "280kcal",
          boxColors: const Color.fromARGB(255, 253, 146, 248),
          viewIsSelected: false)
    ];

    return diets;
  }
}
