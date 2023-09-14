import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course/core/utils/app_navigate.dart';
import 'package:online_course/core/utils/app_util.dart';
import 'package:online_course/src/features/course/pesentation/bloc/recommend/recommend_course_bloc.dart';
import 'package:online_course/src/features/course/pesentation/pages/course_detail/course_detail.dart';
import 'package:online_course/src/widgets/custom_progress_indicator.dart';
import 'package:online_course/src/features/course/pesentation/pages/home/widgets/recommend_item.dart';
import 'package:online_course/src/theme/app_color.dart';

class HomeRecommendBlcok extends StatefulWidget {
  const HomeRecommendBlcok({super.key});

  @override
  State<HomeRecommendBlcok> createState() => _HomeRecommendBlcokState();
}

class _HomeRecommendBlcokState extends State<HomeRecommendBlcok> {
  @override
  void initState() {
    super.initState();
    context.read<RecommendCourseBloc>().add(const GetRecommendCourse());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recommended",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: AppColor.textColor),
              ),
              Text(
                "See all",
                style: TextStyle(fontSize: 14, color: AppColor.darker),
              ),
            ],
          ),
        ),
        _buildItemList(),
      ],
    );
  }

  Widget _buildItemList() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
      scrollDirection: Axis.horizontal,
      child: BlocConsumer<RecommendCourseBloc, RecommendCourseState>(
        listener: (context, state) {
          if (state is RecommendCourseError) {
            AppUtil.showSnackbar(context: context, message: state.errorMessage);
          }
        },
        builder: (context, state) {
          AppUtil.debugPrint("recommend: $state");
          if (state is RecommendCoureInitial) {
            return const CustomProgressIndicator();
          } else if (state is RecommendCourseLoaded) {
            final courses = state.courses;
            return Row(
              children: List.generate(
                courses.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: RecommendItem(
                    data: courses[index],
                    onTap: () {
                      AppNavigator.to(
                        context,
                        CourseDetailPage(
                          course: courses[index],
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
