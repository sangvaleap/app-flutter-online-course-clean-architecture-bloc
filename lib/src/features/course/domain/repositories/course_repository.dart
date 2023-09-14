import 'package:online_course/core/utils/typedef.dart';
import 'package:online_course/src/features/course/domain/entities/course.dart';

abstract class CourseRepository {
  const CourseRepository();

  ResultFuture<List<Course>> getCourses();
  ResultFuture<List<Course>> getFeaturedCourses();
  ResultFuture<List<Course>> getRecommendCourses();
}
