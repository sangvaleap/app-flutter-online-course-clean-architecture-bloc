import 'dart:convert';

import 'package:online_course/core/utils/typedef.dart';
import 'package:online_course/src/features/course/domain/entities/course.dart';

// ignore: must_be_immutable
class CourseModel extends Course {
  CourseModel({
    required super.id,
    required super.name,
    required super.description,
    required super.duration,
    required super.image,
    required super.price,
    required super.review,
    required super.session,
    super.isFavorited = false,
  });

  CourseModel.fromMap(DataMap map)
      : this(
          id: map["id"] as int,
          name: map["name"] as String,
          description: map["description"] as String,
          duration: map["duration"] as String,
          image: map["image"] as String,
          price: map["price"] as String,
          review: map["review"] as String,
          session: map["session"] as String,
          isFavorited: map["is_favorited"] as bool,
        );

  factory CourseModel.fromJson(String json) =>
      CourseModel.fromMap(jsonDecode(json) as DataMap);

  CourseModel copyWith({
    int? id,
    String? name,
    String? price,
    String? image,
    String? duration,
    String? session,
    String? review,
    String? description,
    bool? isFavorited,
  }) =>
      CourseModel(
          id: id ?? this.id,
          name: name ?? this.name,
          price: price ?? this.price,
          image: image ?? this.image,
          duration: duration ?? this.duration,
          session: session ?? this.session,
          review: review ?? this.review,
          description: description ?? this.description,
          isFavorited: isFavorited ?? this.isFavorited);

  factory CourseModel.empty() => CourseModel(
        id: 0,
        name: "_empty.name",
        price: "_empty.price",
        image: "_empty.image",
        duration: "_empty.duration",
        session: "_empty.session",
        review: "_empty.review",
        description: "_empty.description",
        isFavorited: false,
      );
}
