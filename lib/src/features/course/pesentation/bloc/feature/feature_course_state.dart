part of 'feature_course_bloc.dart';

class FeatureCourseState extends Equatable {
  const FeatureCourseState();

  @override
  List<Object> get props => [];
}

class FeatureCourseInitial extends FeatureCourseState {
  const FeatureCourseInitial();
}

class FeatureCourseLoading extends FeatureCourseState {
  const FeatureCourseLoading();
}

class FeatureCourseLoaded extends FeatureCourseState {
  const FeatureCourseLoaded(this.courses);

  final List<Course> courses;
}

class FeatureCourseError extends FeatureCourseState {
  const FeatureCourseError(this.errorMessage);

  final String errorMessage;
}
