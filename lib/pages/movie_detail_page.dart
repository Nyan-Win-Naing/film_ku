import 'package:film_ku/resources/colors.dart';
import 'package:film_ku/viewitems/genre_view.dart';
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
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 16),
                MovieActionSectionView(),
                SizedBox(height: 24),
                GenreAndDurationSectionView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GenreAndDurationSectionView extends StatelessWidget {
  const GenreAndDurationSectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Wrap(
              spacing: 8,

              /// horizontal
              runSpacing: 8,

              /// vertical
              children: List.generate(5, (index) {
                return GenreView();
              }),
            ),
          ),
          SizedBox(width: 16),
          IconAndLabelView(
            iconData: Icons.access_time_rounded,
            label: "2h 13m",
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class MovieActionSectionView extends StatelessWidget {
  const MovieActionSectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PlayButtonView(),
        SizedBox(width: 12),
        DownloadButtonView(
          iconColor: kOrangeColor,
          iconData: Icons.download_rounded,
        ),
        SizedBox(width: 12),
        DownloadButtonView(
          iconColor: kHighlightColor,
          iconData: Icons.ios_share_outlined,
        ),
      ],
    );
  }
}

class DownloadButtonView extends StatelessWidget {
  final Color iconColor;
  final IconData iconData;

  DownloadButtonView({
    required this.iconColor,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: kDownloadButtonBackgroundColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        iconData,
        color: iconColor,
      ),
    );
  }
}

class PlayButtonView extends StatelessWidget {
  const PlayButtonView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: kOrangeColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
          SizedBox(width: 8),
          Text(
            "Play",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
