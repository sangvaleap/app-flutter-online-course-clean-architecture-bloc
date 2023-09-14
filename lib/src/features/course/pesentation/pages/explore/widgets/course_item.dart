import 'package:flutter/material.dart';
import 'package:online_course/src/features/course/domain/entities/course.dart';
import 'package:online_course/src/theme/app_color.dart';

import '../../../../../../widgets/custom_image.dart';
import '../../../../../../widgets/favorite_box.dart';

class CourseItem extends StatelessWidget {
  const CourseItem(
      {Key? key,
      required this.course,
      this.onTap,
      this.width = 200,
      this.height = 290})
      : super(key: key);
  final Course course;
  final double width;
  final double height;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 5, top: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          children: [
            _buildCourseImage(),
            Positioned(
              top: 170,
              right: 15,
              child: FavoriteBox(
                isFavorited: course.isFavorited,
                onChanged: (favorited) {},
              ),
            ),
            Positioned(
              top: 210,
              child: _buildCourseInfo(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCourseInfo() {
    return Container(
      width: width - 50,
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                course.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 17,
                  color: AppColor.textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          _buildAttributeBlock(),
        ],
      ),
    );
  }

  Widget _buildCourseImage() {
    return Hero(
      tag: '${course.id}${course.image}',
      child: CustomImage(
        course.image,
        width: width,
        height: 190,
        radius: 15,
      ),
    );
  }

  Widget _buildAttributeBlock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildAttribute(Icons.sell_outlined, AppColor.labelColor, course.price),
        _buildAttribute(
            Icons.play_circle_outlined, AppColor.labelColor, course.session),
        _buildAttribute(
            Icons.schedule_rounded, AppColor.labelColor, course.duration),
        _buildAttribute(Icons.star, AppColor.yellow, course.review),
      ],
    );
  }

  Widget _buildAttribute(IconData icon, Color color, String info) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: color,
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          info,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: AppColor.labelColor, fontSize: 13),
        ),
      ],
    );
  }
}
