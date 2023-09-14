import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_course/src/features/course/domain/entities/course.dart';
import 'package:online_course/src/features/course/domain/usecases/get_feature_course.dart';

part 'feature_course_event.dart';
part 'feature_course_state.dart';

class FeatureCourseBloc extends Bloc<FeatureCourseEvent, FeatureCourseState> {
  final GetFeatureCourseUseCase _getFeaturedCourseUseCase;
  FeatureCourseBloc(this._getFeaturedCourseUseCase)
      : super(const FeatureCourseInitial()) {
    on<GetFeatureCourse>(_getFeaturedCourseHanlder);
  }

  _getFeaturedCourseHanlder(event, emit) async {
    emit(const FeatureCourseLoading());
    final result = await _getFeaturedCourseUseCase();
    result.fold(
      (failure) => emit(FeatureCourseError(failure.errorMessage)),
      (r) => emit(FeatureCourseLoaded(r)),
    );
  }
}
