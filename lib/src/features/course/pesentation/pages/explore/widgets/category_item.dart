import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course/src/theme/app_color.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {Key? key, required this.data, this.isSelected = false, this.onTap})
      : super(key: key);
  final Map data;
  final bool isSelected;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primary : AppColor.cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(0.05),
              spreadRadius: .5,
              blurRadius: .5,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              data["icon"],
              colorFilter: ColorFilter.mode(
                  isSelected ? Colors.white : AppColor.darker, BlendMode.srcIn),
              width: 16,
              height: 16,
            ),
            const SizedBox(
              width: 7,
            ),
            Text(
              data["name"],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                color: isSelected ? Colors.white : AppColor.darker,
              ),
            )
          ],
        ),
      ),
    );
  }
}
