import 'package:online_course/core/errors/exception.dart';
import 'package:online_course/core/utils/dummy_data.dart';
import 'package:online_course/src/features/course/data/models/course_model.dart';

abstract class CourseRemoteDataSource {
  Future<List<CourseModel>> getCourses();
  Future<List<CourseModel>> getFeaturedCourses();
  Future<List<CourseModel>> getRecommendCourses();
}

class CourseRemoteDataSourceImpl implements CourseRemoteDataSource {
  CourseRemoteDataSourceImpl();

  @override
  Future<List<CourseModel>> getCourses() async {
    //==== Todo: implement the call to real api =====
    try {
      // dummy data
      return coursesData.map((e) => CourseModel.fromMap(e)).toList();

      // final result = await http.get(Uri.parse(NetworkUrls.getCourses));
      // if (result.statusCode == 200) {
      //   return CourseMapper.jsonToCourseModelList(result.body);
      // }
      // return [];
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<CourseModel>> getFeaturedCourses() async {
    //==== Todo: implement the call to real api =====
    try {
      // dummy data
      return featuresData.map((e) => CourseModel.fromMap(e)).toList();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<CourseModel>> getRecommendCourses() async {
    //==== Todo: implement the call to real api =====
    try {
      // dummy data
      return recommendsData.map((e) => CourseModel.fromMap(e)).toList();
    } catch (e) {
      throw ServerException();
    }
  }
}
