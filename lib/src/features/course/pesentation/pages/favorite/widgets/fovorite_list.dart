import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course/core/utils/app_navigate.dart';
import 'package:online_course/src/features/course/domain/entities/course.dart';
import 'package:online_course/src/features/course/pesentation/bloc/favorite_course/favorite_course_bloc.dart';
import 'package:online_course/src/features/course/pesentation/pages/course_detail/course_detail.dart';
import 'package:online_course/src/features/course/pesentation/pages/favorite/widgets/favorite_item.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCourseBloc, FavoriteCourseState>(
      builder: (context, state) {
        if (state is FavoiriteCourseLoaded) {
          final courses = context.read<FavoriteCourseBloc>().courses;
          return _buildList(courses);
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildList(List<Course> favoritedCourses) {
    if (favoritedCourses.isEmpty) {
      return const Center(
        child: Text(
          "No data",
          style: TextStyle(fontSize: 20),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) {
        return FavoriteItem(
          course: favoritedCourses[index],
          onTap: () {
            AppNavigator.to(
              context,
              CourseDetailPage(course: favoritedCourses[index]),
            );
          },
          onDelete: (context) {
            BlocProvider.of<FavoriteCourseBloc>(context)
                .add(RemoveFavoriteCourse(favoritedCourses[index]));
          },
        );
      },
      itemCount: favoritedCourses.length,
    );
  }
}
