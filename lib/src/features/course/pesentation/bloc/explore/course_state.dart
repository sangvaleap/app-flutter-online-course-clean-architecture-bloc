part of 'course_bloc.dart';

class CourseState extends Equatable {
  const CourseState();
  @override
  List<Object> get props => [];
}

class GetCourseState extends CourseState {
  const GetCourseState();
}

class GetCourseInitial extends GetCourseState {
  const GetCourseInitial();
}

class GetCoursesLoading extends GetCourseState {
  const GetCoursesLoading();
}

class GetCoursesLoaded extends GetCourseState {
  const GetCoursesLoaded(this.courses);

  final List<Course> courses;
}

class GetCoursesError extends GetCourseState {
  const GetCoursesError(this.errorMessage);

  final String errorMessage;
}
