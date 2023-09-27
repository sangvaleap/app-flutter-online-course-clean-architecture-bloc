import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course/src/features/course/domain/entities/course.dart';
import 'package:online_course/src/features/course/domain/usecases/get_course.dart';
import 'package:online_course/src/features/course/domain/usecases/get_feature_course.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final GetCourseUseCase getCourseUseCase;
  final GetFeatureCourseUseCase getFeaturedCourseUseCase;

  CourseBloc(
      {required this.getCourseUseCase, required this.getFeaturedCourseUseCase})
      : super(const GetCourseInitial()) {
    on<GetCourses>(_getCoursesEventHandler);
  }

  Future<void> _getCoursesEventHandler(
      GetCourses event, Emitter<CourseState> emit) async {
    emit(const GetCoursesLoading());
    final result = await getCourseUseCase();
    result.fold(
      (failure) => emit(GetCoursesError(failure.errorMessage)),
      (r) => emit(GetCoursesLoaded(r)),
    );
  }
}
