import 'package:flutter/material.dart';
import 'package:online_course/src/widgets/custom_textfield.dart';

class ChatSearchBlock extends StatelessWidget {
  const ChatSearchBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: CustomTextBox(
        hint: "Search",
        prefix: Icon(
          Icons.search,
          color: Colors.grey,
        ),
      ),
    );
  }
}
