import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course/src/theme/app_color.dart';

class FavoriteBoxV2 extends StatelessWidget {
  const FavoriteBoxV2({
    Key? key,
    this.bgColor = Colors.white,
    this.isFavorited = false,
    this.borderColor = Colors.transparent,
    this.radius = 50,
    this.size = 22,
    this.padding = 8,
    this.onTap,
  }) : super(key: key);

  final Color borderColor;
  final Color? bgColor;
  final bool isFavorited;
  final double radius;
  final double size;
  final double padding;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        padding: EdgeInsets.all(padding),
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: isFavorited ? AppColor.primary : bgColor,
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: SvgPicture.asset(
          "assets/icons/bookmark.svg",
          colorFilter: ColorFilter.mode(
              isFavorited ? Colors.white : AppColor.primary, BlendMode.srcIn),
          width: size,
          height: size,
        ),
      ),
    );
  }
}
