import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go1/models/category_model.dart';
import 'package:go1/models/diet_model.dart';
import 'package:go1/models/popular_diets_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> popularaDiets = [];

  void _getInitialState() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
    popularaDiets = PopularDietsModel.getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialState();
    return Scaffold(
      appBar: myAppBar(),
      backgroundColor: Colors.white,
      body: ListView(children: [
        _searchBar(),
        const SizedBox(
          height: 30,
        ),
        _categorySection(),
        const SizedBox(
          height: 30,
        ),
        _dietSelection(),
        const SizedBox(
          height: 30,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 24),
              child: Text(
                "Popular",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 15),
            ListView.separated(
                itemCount: popularaDiets.length,
                shrinkWrap: true,
                separatorBuilder: (context, index) => const SizedBox(
                      height: 25,
                    ),
                padding: const EdgeInsets.only(left: 20, right: 20),
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: popularaDiets[index].boxIsSelected
                            ? [
                                BoxShadow(
                                    color: const Color(0XFF1D1617)
                                        .withOpacity(0.09),
                                    offset: const Offset(0, 10),
                                    blurRadius: 40,
                                    spreadRadius: 0)
                              ]
                            : []),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.black12.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(50)),
                          child:
                              SvgPicture.asset(popularaDiets[index].iconPath),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              popularaDiets[index].name,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Text(
                              '${popularaDiets[index].level} | ${popularaDiets[index].duration} | ${popularaDiets[index].calorie} ',
                              style: const TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 160, 160, 160),
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 137, 133, 134),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        )
                      ],
                    ),
                  );
                })
          ],
        ),
        const SizedBox(
          height: 30,
        ),
      ]),
    );
  }

  Column _dietSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Text(
            "Recommendation\nfor Diet",
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Colors.black, fontSize: 18),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 250,
          child: ListView.separated(
              itemCount: diets.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 25),
              padding: const EdgeInsets.only(left: 20, right: 20),
              itemBuilder: (context, index) {
                return Container(
                  width: 210,
                  decoration: BoxDecoration(
                    color: diets[index].boxColors.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // SvgPicture.asset(diets[index].iconPath),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: const Color.fromARGB(46, 123, 111, 114),
                              ),
                              borderRadius: BorderRadius.circular(50)),
                          child: SvgPicture.asset(diets[index].iconPath),
                        ),
                        Text(
                          diets[index].name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '${diets[index].level} | ${diets[index].duration} | ${diets[index].calorie}',
                          style: const TextStyle(
                              color: Color(0XFF7b6f72),
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                        ),
                        Container(
                          height: 45,
                          width: 130,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              diets[index].viewIsSelected
                                  ? const Color(0XFF9DCEFF)
                                  : Colors.transparent,
                              diets[index].viewIsSelected
                                  ? const Color(0XFF92A3FD)
                                  : Colors.transparent,
                            ]),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              "view",
                              style: TextStyle(
                                  color: diets[index].viewIsSelected
                                      ? Colors.white
                                      : const Color(0XFFc58bf2),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                          ),
                        )
                      ]),
                );
              }),
        )
      ],
    );
  }

  Column _categorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Text(
            "Category",
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Colors.black, fontSize: 18),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 120,
          child: ListView.separated(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(
                    width: 25,
                  ),
              padding: const EdgeInsets.only(left: 20, right: 20),
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  decoration: BoxDecoration(
                      color: categories[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(14)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(categories[index].iconPath),
                        ),
                        Text(
                          categories[index].name,
                          style: const TextStyle(
                              color: Colors.black38,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )
                      ]),
                );
              }),
        )
      ],
    );
  }

  Container _searchBar() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0XFF1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: "Make research",
          hintStyle: const TextStyle(color: Color(0XffDDDADA)),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10),
            // ignore: deprecated_member_use
            child: SvgPicture.asset("assets/icons/search.svg",
                color: Colors.black26),
          ),
          suffixIcon: SizedBox(
            width: 100,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const VerticalDivider(
                    color: Colors.black26,
                    indent: 10,
                    endIndent: 10,
                    thickness: 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    // ignore: deprecated_member_use
                    child: SvgPicture.asset(
                      "assets/icons/adjustments.svg",
                      color: Colors.black26,
                    ),
                  ),
                ],
              ),
            ),
          ),
          contentPadding: const EdgeInsets.all(15),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      title: Text(
        "Acueil",
        style: TextStyle(
            color: Colors.black.withAlpha(400),
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () => {},
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: const Color(0XFFF7F8F8),
              borderRadius: BorderRadius.circular(7)),
          child: SvgPicture.asset(
            "assets/icons/chevron-left.svg",
            height: 20,
            width: 20,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () => {},
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10),
            width: 37,
            decoration: BoxDecoration(
                color: const Color(0XFFF7F8F8),
                borderRadius: BorderRadius.circular(7)),
            child: SvgPicture.asset(
              "assets/icons/dots.svg",
              height: 30,
              width: 30,
            ),
          ),
        ),
      ],
    );
  }
}
