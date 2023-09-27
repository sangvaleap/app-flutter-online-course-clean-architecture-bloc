part of 'favorite_course_bloc.dart';

sealed class FavoriteCourseEvent extends Equatable {
  const FavoriteCourseEvent();

  @override
  List<Object> get props => [];
}

class ToggleFavoriteCourse extends FavoriteCourseEvent {
  const ToggleFavoriteCourse(this.course);

  final Course course;

  @override
  List<Object> get props => [course];
}

class RemoveFavoriteCourse extends FavoriteCourseEvent {
  const RemoveFavoriteCourse(this.course);

  final Course course;

  @override
  List<Object> get props => [course];
}
