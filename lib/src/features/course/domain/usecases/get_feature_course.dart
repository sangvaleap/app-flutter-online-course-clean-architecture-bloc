import 'package:online_course/core/utils/typedef.dart';
import 'package:online_course/core/utils/usecase.dart';
import 'package:online_course/src/features/course/domain/entities/course.dart';
import 'package:online_course/src/features/course/domain/repositories/course_repository.dart';

class GetFeatureCourseUseCase extends UseCaseWithoutParams<List<Course>> {
  const GetFeatureCourseUseCase(this._courseRepository);
  final CourseRepository _courseRepository;
  @override
  ResultFuture<List<Course>> call() async {
    return await _courseRepository.getFeaturedCourses();
  }
}
