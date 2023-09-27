import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course/src/features/course/domain/entities/course.dart';

part 'favorite_course_event.dart';
part 'favorite_course_state.dart';

class FavoriteCourseBloc
    extends Bloc<FavoriteCourseEvent, FavoriteCourseState> {
  final List<Course> courses = [];

  FavoriteCourseBloc() : super(const FavoriteCourseInitial()) {
    on<ToggleFavoriteCourse>(_favoriteCourseEventHandler);
    on<RemoveFavoriteCourse>(_removeFavoriteCourse);
  }

  Future<void> _favoriteCourseEventHandler(
      ToggleFavoriteCourse event, Emitter<FavoriteCourseState> emit) async {
    emit(const FavoiriteCourseLoading());
    event.course.isFavorited = !event.course.isFavorited;
    if (_checkCourseExist(event.course)) {
      courses.remove(event.course);
    } else {
      courses.add(event.course);
    }
    emit(FavoiriteCourseLoaded(event.course));
  }

  bool _checkCourseExist(Course course) {
    return courses.contains(course);
  }

  _removeFavoriteCourse(
      RemoveFavoriteCourse event, Emitter<FavoriteCourseState> emit) async {
    emit(const FavoiriteCourseLoading());
    event.course.isFavorited = false;
    if (_checkCourseExist(event.course)) {
      courses.remove(event.course);
    }
    emit(FavoiriteCourseLoaded(event.course));
  }
}
