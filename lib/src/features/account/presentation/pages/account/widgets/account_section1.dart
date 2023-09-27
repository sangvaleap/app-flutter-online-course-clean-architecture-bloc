import 'package:flutter/material.dart';
import 'package:online_course/core/utils/app_navigate.dart';
import 'package:online_course/src/features/account/presentation/pages/account/widgets/setting_item.dart';
import 'package:online_course/src/features/course/pesentation/pages/favorite/favorite.dart';
import 'package:online_course/src/theme/app_color.dart';

class AccountBlock1 extends StatelessWidget {
  const AccountBlock1({super.key});

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
      child: Column(
        children: [
          const SettingItem(
            title: "Setting",
            leadingIcon: "assets/icons/setting.svg",
            bgIconColor: AppColor.blue,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 45),
            child: Divider(
              height: 0,
              color: Colors.grey.withOpacity(0.8),
            ),
          ),
          const SettingItem(
            title: "Payment",
            leadingIcon: "assets/icons/wallet.svg",
            bgIconColor: AppColor.green,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 45),
            child: Divider(
              height: 0,
              color: Colors.grey.withOpacity(0.8),
            ),
          ),
          SettingItem(
            title: "Favorites",
            leadingIcon: "assets/icons/bookmark.svg",
            bgIconColor: AppColor.primary,
            onTap: () {
              AppNavigator.to(context, const FavoritePage());
            },
          ),
        ],
      ),
    );
  }
}
