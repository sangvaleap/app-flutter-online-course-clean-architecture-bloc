import 'package:flutter/material.dart';
import 'package:online_course/src/features/course/domain/entities/course.dart';
import 'package:online_course/src/widgets/custom_image.dart';

class CourseDetailImage extends StatelessWidget {
  const CourseDetailImage(
      {required this.course, this.isHero = false, super.key});
  final Course course;
  final bool isHero;

  @override
  Widget build(BuildContext context) {
    return isHero
        ? Hero(
            tag: '${course.id}${course.image}',
            child: CustomImage(
              course.image,
              radius: 10,
              width: double.infinity,
              height: 220,
            ),
          )
        : CustomImage(
            course.image,
            radius: 10,
            width: double.infinity,
            height: 220,
          );
  }
}
