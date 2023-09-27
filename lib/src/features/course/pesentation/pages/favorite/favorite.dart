import 'package:flutter/material.dart';
import 'package:online_course/src/features/course/pesentation/pages/favorite/widgets/fovorite_list.dart';
import 'package:online_course/src/widgets/custom_appbar.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: "Favorites",
      ),
      body: FavoriteList(),
    );
  }
}
