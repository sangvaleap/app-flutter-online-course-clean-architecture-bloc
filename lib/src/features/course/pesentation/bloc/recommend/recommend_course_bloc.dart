import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_course/src/features/course/domain/entities/course.dart';
import 'package:online_course/src/features/course/domain/usecases/get_recommend_course.dart';

part 'recommend_course_event.dart';
part 'recommend_course_state.dart';

class RecommendCourseBloc
    extends Bloc<RecommendCourseEvent, RecommendCourseState> {
  final GetRecommendCourseUserCase _getRecommendCourseUserCase;
  RecommendCourseBloc(this._getRecommendCourseUserCase)
      : super(const RecommendCoureInitial()) {
    on<GetRecommendCourse>(_getRecommendCourseHandler);
  }

  _getRecommendCourseHandler(event, emit) async {
    emit(const RecommendCoureInitial());
    final result = await _getRecommendCourseUserCase();
    result.fold(
      (failure) => emit(RecommendCourseError(failure.errorMessage)),
      (r) => emit(RecommendCourseLoaded(r)),
    );
  }
}
