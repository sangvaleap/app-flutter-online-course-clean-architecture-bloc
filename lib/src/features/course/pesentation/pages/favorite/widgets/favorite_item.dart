import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:online_course/src/features/course/domain/entities/course.dart';
import 'package:online_course/src/theme/app_color.dart';
import 'package:online_course/src/widgets/custom_image.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({
    Key? key,
    required this.course,
    this.onTap,
    this.onDelete,
  }) : super(key: key);

  final Course course;
  final GestureTapCallback? onTap;
  final Function(BuildContext)? onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Slidable(
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  key: ValueKey(course.id),
                  flex: 8,
                  onPressed: onDelete,
                  backgroundColor: AppColor.actionColor,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  CustomImage(
                    course.image,
                    radius: 15,
                    height: 80,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  _buildInfo()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          course.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: AppColor.textColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          course.price,
          style: const TextStyle(fontSize: 14, color: AppColor.textColor),
        ),
        const SizedBox(
          height: 15,
        ),
        _buildDurationAndRate()
      ],
    );
  }

  Widget _buildDurationAndRate() {
    return Row(
      children: [
        const Icon(
          Icons.schedule_rounded,
          color: AppColor.labelColor,
          size: 14,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          course.duration,
          style: const TextStyle(
            fontSize: 12,
            color: AppColor.labelColor,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        const Icon(
          Icons.star,
          color: AppColor.orange,
          size: 14,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          course.review,
          style: const TextStyle(
            fontSize: 12,
            color: AppColor.labelColor,
          ),
        )
      ],
    );
  }
}
