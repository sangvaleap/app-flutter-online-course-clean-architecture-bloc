import 'package:dartz/dartz.dart';
import 'package:online_course/core/errors/exception.dart';
import 'package:online_course/core/errors/failure.dart';
import 'package:online_course/core/utils/typedef.dart';
import 'package:online_course/src/features/course/data/datasources/course_remote_data_source.dart';
import 'package:online_course/src/features/course/data/models/course_model.dart';
import 'package:online_course/src/features/course/domain/entities/course.dart';
import 'package:online_course/src/features/course/domain/repositories/course_repository.dart';

class CourseRepositoryImpl extends CourseRepository {
  const CourseRepositoryImpl(this._courseRemoteDataSource);
  final CourseRemoteDataSource _courseRemoteDataSource;

  @override
  ResultFuture<List<CourseModel>> getCourses() async {
    try {
      final result = await _courseRemoteDataSource.getCourses();
      return Right(result);
    } on ServerException {
      return const Left(
        ServerFailure(message: 'failed to connect to server', statusCode: 400),
      );
    }
  }

  @override
  ResultFuture<List<Course>> getFeaturedCourses() async {
    try {
      final result = await _courseRemoteDataSource.getFeaturedCourses();
      return Right(result);
    } on ServerException {
      return const Left(
        ServerFailure(message: 'failed to connect to server', statusCode: 400),
      );
    }
  }

  @override
  ResultFuture<List<Course>> getRecommendCourses() async {
    try {
      final result = await _courseRemoteDataSource.getRecommendCourses();
      return Right(result);
    } on ServerException {
      return const Left(
        ServerFailure(message: 'failed to connect to server', statusCode: 400),
      );
    }
  }
}
