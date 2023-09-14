import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_course/src/widgets/custom_textfield.dart';
import 'package:online_course/src/widgets/icon_box.dart';
import 'package:online_course/src/theme/app_color.dart';

class ExploreSearchBlock extends StatefulWidget {
  const ExploreSearchBlock({super.key});

  @override
  State<ExploreSearchBlock> createState() => _ExploreSearchBlockState();
}

class _ExploreSearchBlockState extends State<ExploreSearchBlock> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Row(
        children: [
          const Expanded(
            child: CustomTextBox(
              hint: "Search",
              prefix: Icon(Icons.search, color: Colors.grey),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconBox(
            bgColor: AppColor.primary,
            radius: 10,
            onTap: () {},
            child: SvgPicture.asset(
              "assets/icons/filter.svg",
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              width: 24,
              height: 24,
            ),
          )
        ],
      ),
    );
  }
}
