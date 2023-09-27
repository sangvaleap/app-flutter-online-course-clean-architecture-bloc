import 'package:flutter/material.dart';
import 'package:online_course/src/features/course/domain/entities/course.dart';
import 'package:online_course/src/features/course/pesentation/pages/course_detail/widgets/course_detail_bottom_block.dart';
import 'package:online_course/src/features/course/pesentation/pages/course_detail/widgets/course_detail_image.dart';
import 'package:online_course/src/features/course/pesentation/pages/course_detail/widgets/course_detail_info.dart';
import 'package:online_course/src/features/course/pesentation/pages/course_detail/widgets/course_detail_tabbar.dart';
import 'package:online_course/src/theme/app_color.dart';
import 'package:online_course/src/widgets/custom_appbar.dart';

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({required this.course, this.isHero = false, Key? key})
      : super(key: key);
  final Course course;
  final bool isHero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      appBar: const CustomAppBar(title: "Detail"),
      body: _buildBody(),
      bottomNavigationBar: CourseDetailBottomBlock(course: course),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CourseDetailImage(
            course: course,
            isHero: isHero,
          ),
          const SizedBox(
            height: 15,
          ),
          CourseDetailInfo(
            course: course,
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(),
          const CourseDetailTabBar()
        ],
      ),
    );
  }
}
