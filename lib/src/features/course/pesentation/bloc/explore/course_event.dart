part of 'course_bloc.dart';

sealed class CourseEvent extends Equatable {
  const CourseEvent();

  @override
  List<Object> get props => [];
}

class GetCourses extends CourseEvent {
  const GetCourses();
}

class FavoriteCourse extends CourseEvent {
  const FavoriteCourse({required this.course, required this.value});

  final Course course;
  final bool value;
}
