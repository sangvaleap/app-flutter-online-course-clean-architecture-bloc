import 'package:flutter/material.dart';
import 'package:online_course/src/theme/app_color.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Chat",
          style: TextStyle(
            fontSize: 28,
            color: AppColor.textColor,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
