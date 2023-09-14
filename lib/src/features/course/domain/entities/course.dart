import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Course extends Equatable {
  Course(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.duration,
      required this.session,
      required this.review,
      required this.description,
      this.isFavorited = false});

  final int id;
  final String name;
  final String price;
  final String image;
  final String duration;
  final String session;
  final String review;
  final String description;
  bool isFavorited;

  @override
  List<Object?> get props =>
      [id, name, price, image, duration, session, review, description];
}
