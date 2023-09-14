import 'package:flutter/material.dart';
import 'package:online_course/core/utils/dummy_data.dart';
import 'package:online_course/src/features/course/pesentation/pages/home/widgets/home_appbar.dart';
import 'package:online_course/src/features/course/pesentation/pages/home/widgets/home_category.dart';
import 'package:online_course/src/features/course/pesentation/pages/home/widgets/home_feature_block.dart';
import 'package:online_course/src/features/course/pesentation/pages/home/widgets/home_recommend_block.dart';
import 'package:online_course/src/theme/app_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColor.appBarColor,
            pinned: true,
            snap: true,
            floating: true,
            title: HomeAppBar(profile: profile),
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
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeCategory(
            categories: categories,
          ),
          const SizedBox(
            height: 15,
          ),
          const HomeFeatureBlock(),
          const SizedBox(
            height: 15,
          ),
          const HomeRecommendBlcok(),
        ],
      ),
    );
  }
}
