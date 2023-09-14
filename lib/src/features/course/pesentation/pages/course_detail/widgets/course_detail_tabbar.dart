import 'package:flutter/material.dart';
import 'package:online_course/core/utils/dummy_data.dart';
import 'package:online_course/src/features/course/pesentation/pages/course_detail/widgets/course_detail_lesson_list.dart';
import 'package:online_course/src/theme/app_color.dart';

class CourseDetailTabBar extends StatefulWidget {
  const CourseDetailTabBar({super.key});

  @override
  State<CourseDetailTabBar> createState() => _CourseDetailTabBarState();
}

class _CourseDetailTabBarState extends State<CourseDetailTabBar>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  late TabController tabController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_buildTabBar(), _buildTabBarPages()],
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: tabController,
      labelColor: Colors.redAccent,
      isScrollable: false,
      indicatorColor: AppColor.primary,
      tabs: const [
        Tab(
          child: Text(
            "Lessons",
            style: TextStyle(color: AppColor.darker, fontSize: 16),
          ),
        ),
        Tab(
          child: Text(
            "Exercises",
            style: TextStyle(color: AppColor.darker, fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildTabBarPages() {
    return Container(
      constraints: const BoxConstraints(minHeight: 150, maxHeight: 350),
      width: double.infinity,
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
          CourseDetailLessonList(lessons: lessons),
          const Center(
            child: Text(
              "Coming Soon!",
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
