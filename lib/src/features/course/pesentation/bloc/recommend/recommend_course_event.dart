part of 'recommend_course_bloc.dart';

sealed class RecommendCourseEvent extends Equatable {
  const RecommendCourseEvent();

  @override
  List<Object> get props => [];
}

class GetRecommendCourse extends RecommendCourseEvent {
  const GetRecommendCourse();
}
