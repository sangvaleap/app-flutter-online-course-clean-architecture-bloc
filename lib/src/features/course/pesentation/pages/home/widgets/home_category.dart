import 'package:flutter/material.dart';
import 'package:online_course/src/features/course/pesentation/pages/home/widgets/category_box.dart';

class HomeCategory extends StatelessWidget {
  const HomeCategory({required this.categories, super.key});

  final List categories;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CategoryBox(
              selectedColor: Colors.white,
              data: categories[index],
              onTap: null,
            ),
          ),
        ),
      ),
    );
  }
}
