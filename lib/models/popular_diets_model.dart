import 'package:flutter/material.dart';

class PopularDietsModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  Color boxColors;
  bool boxIsSelected;

  PopularDietsModel(
      {required this.name,
      required this.iconPath,
      required this.level,
      required this.duration,
      required this.calorie,
      required this.boxIsSelected,
      required this.boxColors});

  static List<PopularDietsModel> getPopularDiets() {
    List<PopularDietsModel> popularDiets = [
      PopularDietsModel(
          name: "Tomato Pizza",
          iconPath: "assets/images/pizza.svg",
          level: "A bit easy",
          duration: "45mins",
          calorie: "110kcal",
          boxColors: const Color.fromARGB(255, 216, 255, 168),
          boxIsSelected: true),
      PopularDietsModel(
          name: "Honey Cake",
          iconPath: "assets/images/cake.svg",
          level: "medium",
          duration: "30mins",
          calorie: "180kcal",
          boxColors: const Color.fromARGB(255, 146, 253, 166),
          boxIsSelected: false),
      PopularDietsModel(
          name: "Honey pancake",
          iconPath: "assets/images/cake.svg",
          level: "Hard",
          duration: "1h30mins",
          calorie: "280kcal",
          boxColors: const Color.fromARGB(255, 253, 146, 248),
          boxIsSelected: false)
    ];

    return popularDiets;
  }
}
