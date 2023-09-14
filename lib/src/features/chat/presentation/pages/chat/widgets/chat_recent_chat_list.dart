import 'package:flutter/material.dart';
import 'package:online_course/src/features/chat/presentation/pages/chat/widgets/chat_item.dart';

class ChatRecentChatList extends StatelessWidget {
  const ChatRecentChatList({required this.chats, super.key});
  final List chats;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 10),
      shrinkWrap: true,
      children: List.generate(
        chats.length,
        (index) => ChatItem(
          chats[index],
        ),
      ),
    );
  }
}
