import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course/core/utils/app_navigate.dart';
import 'package:online_course/core/utils/app_util.dart';
import 'package:online_course/src/features/course/domain/entities/course.dart';
import 'package:online_course/src/features/course/pesentation/bloc/explore/course_bloc.dart';
import 'package:online_course/src/features/course/pesentation/pages/course_detail/course_detail.dart';
import 'package:online_course/src/features/course/pesentation/pages/explore/widgets/course_item.dart';
import 'package:online_course/src/widgets/custom_progress_indicator.dart';

class ExploreCourseList extends StatefulWidget {
  const ExploreCourseList({super.key});

  @override
  State<ExploreCourseList> createState() => _ExploreCourseListState();
}

class _ExploreCourseListState extends State<ExploreCourseList> {
  @override
  void initState() {
    super.initState();
    context.read<CourseBloc>().add(const GetCourses());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CourseBloc, CourseState>(
      listener: (context, state) {
        if (state is GetCoursesError) {
          AppUtil.showSnackbar(context: context, message: state.errorMessage);
        }
      },
      buildWhen: (previous, current) {
        return current is GetCourseState;
      },
      builder: (context, state) {
        if (state is GetCoursesLoading) {
          return const CustomProgressIndicator();
        } else if (state is GetCoursesLoaded) {
          final courses = state.courses;
          return _buildItemList(courses);
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildItemList(List<Course> courses) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: courses.length,
      itemBuilder: (context, index) {
        return CourseItem(
          onTap: () {
            AppNavigator.to(
              context,
              CourseDetailPage(
                course: courses[index],
                isHero: true,
              ),
            );
          },
          course: courses[index],
          width: MediaQuery.of(context).size.width,
        );
      },
    );
  }
}
