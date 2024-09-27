import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel(
      {required this.name, required this.iconPath, required this.boxColor});

  // getter for rendering list of categories
  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(
        name: "Pizza",
        iconPath: "assets/images/pizza.svg",
        boxColor: const Color(0xff92A3FD)));

    categories.add(CategoryModel(
        name: "Cake",
        iconPath: "assets/images/cake.svg",
        boxColor: const Color.fromARGB(255, 253, 146, 248)));

    categories.add(CategoryModel(
        name: "Piz",
        iconPath: "assets/images/pizza.svg",
        boxColor: const Color.fromARGB(255, 216, 255, 168)));

    categories.add(CategoryModel(
        name: "Cakko",
        iconPath: "assets/images/cake.svg",
        boxColor: const Color.fromARGB(255, 253, 182, 189)));

    return categories;
  }
}
