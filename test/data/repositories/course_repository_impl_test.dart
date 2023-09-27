import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:online_course/core/errors/exception.dart';
import 'package:online_course/core/errors/failure.dart';
import 'package:online_course/core/utils/dummy_data.dart';
import 'package:online_course/src/features/course/data/datasources/course_remote_data_source.dart';
import 'package:online_course/src/features/course/data/models/course_model.dart';
import 'package:online_course/src/features/course/data/repositories/course_repository_impl.dart';

class MockCourseRemoteDataSource extends Mock
    implements CourseRemoteDataSource {}

void main() {
  late final MockCourseRemoteDataSource mockCourseRemoteDataSource;
  late final CourseRepositoryImpl courseRepositoryImpl;

  final List<CourseModel> courseModels = [CourseModel.fromMap(coursesData[0])];

  setUpAll(() {
    mockCourseRemoteDataSource = MockCourseRemoteDataSource();
    courseRepositoryImpl = CourseRepositoryImpl(mockCourseRemoteDataSource);
  });

  group('get courses', () {
    test('should return list of courses', () async {
      // arrange
      when(() => mockCourseRemoteDataSource.getCourses())
          .thenAnswer((_) async => courseModels);

      // act
      final courses = await courseRepositoryImpl.getCourses();

      // assert
      expect(courses, Right(courseModels));

      // verify
      verify(() => mockCourseRemoteDataSource.getCourses()).called(1);
    });

    test('should return server failure', () async {
      // arrange
      when(() => mockCourseRemoteDataSource.getCourses())
          .thenThrow(ServerException());

      // act
      final courses = await courseRepositoryImpl.getCourses();

      // assert
      expect(
          courses,
          const Left(ServerFailure(
              message: 'failed to connect to server', statusCode: 400)));

      // verify
      verify(() => mockCourseRemoteDataSource.getCourses()).called(1);
    });
  });
}
