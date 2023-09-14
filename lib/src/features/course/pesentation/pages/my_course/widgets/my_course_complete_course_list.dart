import 'package:flutter/material.dart';
import 'package:online_course/src/features/course/pesentation/pages/my_course/widgets/my_course_item.dart';

class MyCourseCompleteCourseList extends StatelessWidget {
  const MyCourseCompleteCourseList(
      {required this.myCompleteCourses, super.key});
  final List myCompleteCourses;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          myCompleteCourses.length,
          (index) => Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
            child: MyCourseItem(
              data: myCompleteCourses[index],
            ),
          ),
        ),
      ),
    );
  }
}
