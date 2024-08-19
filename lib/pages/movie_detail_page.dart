import 'package:film_ku/resources/colors.dart';
import 'package:film_ku/widgets/movie_detail_sliver_app_bar_view.dart';
import 'package:flutter/material.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDetailPageBackgroundColor,
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: CustomScrollView(
        slivers: [
          MovieDetailSliverAppBarView(),
        ],
      ),
    );
  }
}
