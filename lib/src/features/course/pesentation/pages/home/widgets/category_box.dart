import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course/src/theme/app_color.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox({
    Key? key,
    required this.data,
    this.isSelected = false,
    this.onTap,
    this.selectedColor = AppColor.actionColor,
  }) : super(key: key);

  final Map data;
  final Color selectedColor;
  final bool isSelected;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          _buildAnimatedIcon(),
          const SizedBox(
            height: 10,
          ),
          _buildName()
        ],
      ),
    );
  }

  Widget _buildName() {
    return Text(
      data["name"],
      maxLines: 1,
      overflow: TextOverflow.fade,
      style: const TextStyle(
        color: AppColor.textColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildAnimatedIcon() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isSelected ? AppColor.red : Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColor.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(1, 1), // changes position of shadow
          ),
        ],
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        data["icon"],
        colorFilter: ColorFilter.mode(
          isSelected ? selectedColor : AppColor.textColor,
          BlendMode.srcIn,
        ),
        width: 30,
        height: 30,
      ),
    );
  }
}
