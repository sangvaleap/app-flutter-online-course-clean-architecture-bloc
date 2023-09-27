part of 'favorite_course_bloc.dart';

sealed class FavoriteCourseState extends Equatable {
  const FavoriteCourseState();
  @override
  List<Object?> get props => [];
}

class FavoriteCourseInitial extends FavoriteCourseState {
  const FavoriteCourseInitial();
}

class FavoiriteCourseLoading extends FavoriteCourseState {
  const FavoiriteCourseLoading();
}

class FavoiriteCourseLoaded extends FavoriteCourseState {
  const FavoiriteCourseLoaded(this.course);

  final Course course;
}

class FavoiriteCourseError extends FavoriteCourseState {
  const FavoiriteCourseError();
}
