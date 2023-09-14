part of 'recommend_course_bloc.dart';

sealed class RecommendCourseState extends Equatable {
  const RecommendCourseState();

  @override
  List<Object> get props => [];
}

final class RecommendCoureInitial extends RecommendCourseState {
  const RecommendCoureInitial();
}

class RecommendCourseLoading extends RecommendCourseState {
  const RecommendCourseLoading();
}

class RecommendCourseLoaded extends RecommendCourseState {
  const RecommendCourseLoaded(this.courses);

  final List<Course> courses;
}

class RecommendCourseError extends RecommendCourseState {
  const RecommendCourseError(this.errorMessage);

  final String errorMessage;
}
