import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course/core/utils/app_navigate.dart';
import 'package:online_course/src/features/course/domain/entities/course.dart';
import 'package:online_course/src/features/course/pesentation/bloc/feature/feature_course_bloc.dart';
import 'package:online_course/src/features/course/pesentation/pages/course_detail/course_detail.dart';
import 'package:online_course/src/widgets/custom_progress_indicator.dart';
import 'package:online_course/src/features/course/pesentation/pages/home/widgets/feature_item.dart';
import 'package:online_course/src/theme/app_color.dart';

class HomeFeatureBlock extends StatefulWidget {
  const HomeFeatureBlock({super.key});

  @override
  State<HomeFeatureBlock> createState() => _HomeFeatureBlockState();
}

class _HomeFeatureBlockState extends State<HomeFeatureBlock> {
  @override
  void initState() {
    super.initState();
    context.read<FeatureCourseBloc>().add(const GetFeatureCourse());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
          child: Text(
            "Featured",
            style: TextStyle(
              color: AppColor.textColor,
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
        ),
        BlocBuilder<FeatureCourseBloc, FeatureCourseState>(
          builder: (context, state) {
            if (state is FeatureCourseLoading) {
              return const CustomProgressIndicator();
            } else if (state is FeatureCourseLoaded) {
              return _buildSlider(state.courses);
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }

  Widget _buildSlider(List<Course> courses) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 290,
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: .75,
      ),
      items: List.generate(
        courses.length,
        (index) => FeatureItem(
          course: courses[index],
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
    );
  }
}
