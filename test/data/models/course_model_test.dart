import 'package:flutter_test/flutter_test.dart';
import 'package:online_course/core/utils/dummy_data.dart';
import 'package:online_course/src/features/course/data/models/course_model.dart';
import 'package:online_course/src/features/course/domain/entities/course.dart';

void main() {
  final courseModel = CourseModel(
      id: 100,
      name: "UI/UX Design",
      image:
          "https://images.unsplash.com/photo-1596638787647-904d822d751e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      price: "\$110.00",
      duration: "10 hours",
      session: "6 lessons",
      review: "4.5",
      isFavorited: false,
      description:
          "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.");

  final courseMap = courses[0];

  test('should be a subclass of course entity', () {
    expect(courseModel, isA<Course>());
  });

  test('should return valid model from json', () async {
    var courseModelFromMap = CourseModel.fromMap(courseMap);

    expect(courseModelFromMap, courseModel);
  });

  test('should return valid map', () async {
    var courseModelToMap = courseModel.toMap();

    expect(courseModelToMap, courseMap);
  });
}
