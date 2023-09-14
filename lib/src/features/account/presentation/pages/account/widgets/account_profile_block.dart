import 'package:flutter/material.dart';
import 'package:online_course/src/widgets/custom_image.dart';

class AccountProfileBlock extends StatelessWidget {
  const AccountProfileBlock({required this.profile, super.key});
  final Map profile;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomImage(
          profile["image"]!,
          width: 70,
          height: 70,
          radius: 20,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          profile["name"]!,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
