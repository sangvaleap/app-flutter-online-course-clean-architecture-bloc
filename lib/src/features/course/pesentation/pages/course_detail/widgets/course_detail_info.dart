import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course/src/features/course/domain/entities/course.dart';
import 'package:online_course/src/features/course/pesentation/bloc/favorite_course/favorite_course_bloc.dart';
import 'package:online_course/src/theme/app_color.dart';
import 'package:online_course/src/widgets/favorite_box_v2.dart';
import 'package:readmore/readmore.dart';

class CourseDetailInfo extends StatelessWidget {
  const CourseDetailInfo({required this.course, super.key});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                course.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            BlocBuilder<FavoriteCourseBloc, FavoriteCourseState>(
              builder: (context, state) {
                return FavoriteBoxV2(
                  isFavorited: course.isFavorited,
                  onTap: () {
                    BlocProvider.of<FavoriteCourseBloc>(context)
                        .add(ToggleFavoriteCourse(course));
                  },
                );
              },
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            _buildCourseAttribute(Icons.play_circle_outlined,
                AppColor.labelColor, course.session),
            const SizedBox(
              width: 15,
            ),
            _buildCourseAttribute(
                Icons.schedule_rounded, AppColor.labelColor, course.duration),
            const SizedBox(
              width: 15,
            ),
            _buildCourseAttribute(Icons.star, AppColor.yellow, course.review),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          "About Course",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 5,
        ),
        ReadMoreText(
          course.description,
          style: const TextStyle(color: AppColor.labelColor, height: 1.5),
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Show less',
          moreStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColor.red,
          ),
        ),
      ],
    );
  }

  Widget _buildCourseAttribute(IconData icon, Color color, String info) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: color,
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          info,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: AppColor.labelColor, fontSize: 14),
        ),
      ],
    );
  }
}
