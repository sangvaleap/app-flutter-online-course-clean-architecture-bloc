import 'package:flutter/material.dart';
import 'package:online_course/src/theme/app_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.onTap,
      this.title = "",
      this.fsize = 14,
      this.width = double.infinity,
      this.height = 45,
      this.bgColor = AppColor.primary,
      this.icon,
      this.disableButton = false,
      this.isLoading = false,
      this.radius = 10,
      this.textColor = Colors.white})
      : super(key: key);
  final GestureTapCallback onTap;
  final String title;
  final double fsize;
  final Color textColor;
  final double width;
  final double height;
  final double radius;
  final Color bgColor;
  final IconData? icon;
  final bool disableButton;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: disableButton,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: disableButton ? bgColor.withOpacity(0.3) : bgColor,
            boxShadow: [
              BoxShadow(
                color: AppColor.shadowColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          width: width,
          height: height,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: checkButton(isLoading, icon),
          ),
        ),
      ),
    );
  }

  List<Widget> checkButton(bool loading, IconData? icon) {
    if (loading) {
      return [_buildLoading()];
    } else {
      if (icon != null) {
        return [
          _buildIcon(),
          const SizedBox(
            width: 5,
          ),
          _buildTitle()
        ];
      }
    }
    return [_buildTitle()];
  }

  Widget _buildIcon() {
    return Icon(
      icon,
      size: fsize + 7,
      color: disableButton ? textColor.withOpacity(0.3) : textColor,
    );
  }

  Widget _buildTitle() {
    return Text(
      title,
      style: TextStyle(
        fontSize: fsize,
        color: disableButton ? textColor.withOpacity(0.3) : textColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildLoading() {
    return SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        color: textColor,
        strokeWidth: 3,
      ),
    );
  }
}
