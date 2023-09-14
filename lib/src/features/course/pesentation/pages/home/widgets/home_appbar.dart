import 'package:flutter/material.dart';
import 'package:online_course/src/widgets/notification_box.dart';
import 'package:online_course/src/theme/app_color.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({required this.profile, super.key});
  final Map profile;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profile["name"]!,
                style: const TextStyle(
                  color: AppColor.labelColor,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Good Morning!",
                style: TextStyle(
                  color: AppColor.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        const NotificationBox(
          notifiedNumber: 1,
        )
      ],
    );
  }
}
