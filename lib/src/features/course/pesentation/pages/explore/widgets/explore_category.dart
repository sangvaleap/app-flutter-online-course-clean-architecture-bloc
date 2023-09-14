import 'package:flutter/material.dart';
import 'package:online_course/core/utils/dummy_data.dart';
import 'package:online_course/src/features/course/pesentation/pages/explore/widgets/category_item.dart';

class ExploreCategory extends StatefulWidget {
  const ExploreCategory({super.key});

  @override
  State<ExploreCategory> createState() => _ExploreCategoryState();
}

class _ExploreCategoryState extends State<ExploreCategory> {
  int selectedCategory = 0;
  final List _categories = categories;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(bottom: 5, top: 5, left: 15),
      child: Row(
        children: List.generate(
          _categories.length,
          (index) => CategoryItem(
            data: _categories[index],
            isSelected: selectedCategory == index,
            onTap: () {
              setState(() {
                selectedCategory = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
