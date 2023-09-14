import 'package:flutter/material.dart';
import 'package:online_course/src/features/course/domain/entities/course.dart';
import 'package:online_course/src/widgets/custom_button.dart';
import 'package:online_course/src/theme/app_color.dart';

class CourseDetailBottomBlock extends StatelessWidget {
  const CourseDetailBottomBlock({required this.course, super.key});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColor.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Price",
                style: TextStyle(
                  fontSize: 14,
                  color: AppColor.labelColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: course.price,
                      style: const TextStyle(
                        fontSize: 18,
                        color: AppColor.textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: CustomButton(
              radius: 10,
              title: "Buy Now",
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
