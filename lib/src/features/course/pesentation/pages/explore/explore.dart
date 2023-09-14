import 'package:flutter/material.dart';
import 'package:online_course/src/features/course/pesentation/pages/explore/widgets/explore_appbar.dart';
import 'package:online_course/src/features/course/pesentation/pages/explore/widgets/explore_category.dart';
import 'package:online_course/src/features/course/pesentation/pages/explore/widgets/explore_course_list.dart';
import 'package:online_course/src/features/course/pesentation/pages/explore/widgets/explore_search_block.dart';
import 'package:online_course/src/theme/app_color.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: AppColor.appBarColor,
            pinned: true,
            snap: true,
            floating: true,
            title: ExploreAppbar(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildBody(),
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }

  _buildBody() {
    return const SingleChildScrollView(
      child: Column(
        children: [
          ExploreSearchBlock(),
          SizedBox(height: 10),
          ExploreCategory(),
          SizedBox(height: 10),
          ExploreCourseList(),
        ],
      ),
    );
  }
}
