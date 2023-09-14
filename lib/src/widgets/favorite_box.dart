import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course/src/theme/app_color.dart';

class FavoriteBox extends StatefulWidget {
  const FavoriteBox({
    Key? key,
    this.bgColor = Colors.white,
    this.isFavorited = false,
    this.borderColor = Colors.transparent,
    this.radius = 50,
    this.size = 22,
    this.padding = 8,
    this.onChanged,
  }) : super(key: key);

  final Color borderColor;
  final Color? bgColor;
  final bool isFavorited;
  final double radius;
  final double size;
  final double padding;
  final Function(bool favorited)? onChanged;

  @override
  State<FavoriteBox> createState() => _FavoriteBoxState();
}

class _FavoriteBoxState extends State<FavoriteBox> {
  late bool _isFavorited;

  @override
  void initState() {
    super.initState();
    _isFavorited = widget.isFavorited;
  }

  _onFavoriteChanged() {
    setState(() {
      _isFavorited = !_isFavorited;
      _onChangedValue(_isFavorited);
    });
  }

  _onChangedValue(value) {
    if (widget.onChanged != null) widget.onChanged!(value);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onFavoriteChanged,
      child: AnimatedContainer(
        padding: EdgeInsets.all(widget.padding),
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius),
          color: _isFavorited ? AppColor.primary : widget.bgColor,
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
              _isFavorited ? Colors.white : AppColor.primary, BlendMode.srcIn),
          width: widget.size,
          height: widget.size,
        ),
      ),
    );
  }
}
