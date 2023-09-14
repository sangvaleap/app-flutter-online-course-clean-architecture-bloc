import 'package:flutter/material.dart';
import 'package:online_course/core/utils/dummy_data.dart';
import 'package:online_course/src/features/course/pesentation/pages/my_course/widgets/my_course_appbar.dart';
import 'package:online_course/src/features/course/pesentation/pages/my_course/widgets/my_course_complete_course_list.dart';
import 'package:online_course/src/features/course/pesentation/pages/my_course/widgets/my_course_progress_course_list.dart';
import 'package:online_course/src/theme/app_color.dart';

class MyCoursePage extends StatefulWidget {
  const MyCoursePage({Key? key}) : super(key: key);

  @override
  State<MyCoursePage> createState() => _MyCoursePageState();
}

class _MyCoursePageState extends State<MyCoursePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            _buildSilverAppbar(),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: TabBarView(
            controller: tabController,
            children: <Widget>[
              MyCourseProgressCourseList(myProgressCourses: myCourseProgress),
              MyCourseCompleteCourseList(myCompleteCourses: myCourseComplete),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSilverAppbar() {
    return SliverAppBar(
      backgroundColor: AppColor.appBarColor,
      pinned: true,
      snap: true,
      floating: true,
      title: const MyCourseAppBar(),
      bottom: TabBar(
        controller: tabController,
        indicatorColor: AppColor.primary,
        indicatorWeight: 1,
        unselectedLabelColor: AppColor.textColor,
        labelColor: AppColor.primary,
        labelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: [
          Tab(
            text: "Progress (${myCourseProgress.length})",
          ),
          Tab(
            text: "Completed (${myCourseComplete.length})",
          )
        ],
      ),
    );
  }
}
