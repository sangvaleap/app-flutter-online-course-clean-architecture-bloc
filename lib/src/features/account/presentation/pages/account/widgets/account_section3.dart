import 'package:flutter/material.dart';
import 'package:online_course/src/features/account/presentation/pages/account/widgets/setting_item.dart';
import 'package:online_course/src/theme/app_color.dart';

class AccountBlock3 extends StatelessWidget {
  const AccountBlock3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColor.cardColor,
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColor.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: const SettingItem(
        title: "Log Out",
        leadingIcon: "assets/icons/logout.svg",
        bgIconColor: AppColor.darker,
      ),
    );
  }
}
