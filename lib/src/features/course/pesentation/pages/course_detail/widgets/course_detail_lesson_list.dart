import 'package:flutter/material.dart';
import 'package:online_course/src/features/course/pesentation/pages/course_detail/widgets/lesson_item.dart';

class CourseDetailLessonList extends StatelessWidget {
  const CourseDetailLessonList({required this.lessons, super.key});
  final List lessons;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lessons.length,
      itemBuilder: (context, index) {
        return LessonItem(
          data: lessons[index],
        );
      },
    );
  }
}
