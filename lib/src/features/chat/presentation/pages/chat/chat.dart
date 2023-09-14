import 'package:flutter/material.dart';
import 'package:online_course/core/utils/dummy_data.dart';
import 'package:online_course/src/features/chat/presentation/pages/chat/widgets/chat_appbar.dart';
import 'package:online_course/src/features/chat/presentation/pages/chat/widgets/chat_recent_chat_list.dart';
import 'package:online_course/src/features/chat/presentation/pages/chat/widgets/chat_search_block.dart';
import 'package:online_course/src/theme/app_color.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          backgroundColor: AppColor.appBgColor,
          pinned: true,
          snap: true,
          floating: true,
          title: ChatAppBar(),
        ),
        const SliverToBoxAdapter(
          child: ChatSearchBlock(),
        ),
        SliverToBoxAdapter(
          child: ChatRecentChatList(chats: chats),
        )
      ],
    );
  }
}
