import 'package:film_ku/resources/colors.dart';
import 'package:flutter/material.dart';

class MovieDetailSliverAppBarView extends StatelessWidget {
  const MovieDetailSliverAppBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 360,
      backgroundColor: kDetailPageBackgroundColor,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            MovieBackgroundImageView(),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.4),
                      kDetailPageBackgroundColor,
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                // color: Colors.blue,
                child: Column(
                  children: [
                    AppBarWithBackButtonView(),
                    SizedBox(height: 16),
                    MoviePosterView(),
                    SizedBox(height: 16),
                    MovieInfoView(),
                    SizedBox(height: 16),
                    RatingView(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingView extends StatelessWidget {
  const RatingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: IconAndLabelView(
        iconData: Icons.star,
        label: "4.5",
        color: kOrangeColor,
      ),
    );
  }
}

class MovieInfoView extends StatelessWidget {
  const MovieInfoView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconAndLabelView(
          iconData: Icons.calendar_month,
          label: "2021",
        ),
        DividerView(),
        IconAndLabelView(
          iconData: Icons.access_time_filled_rounded,
          label: "148 Minutes",
        ),
        DividerView(),
        IconAndLabelView(
          iconData: Icons.local_movies,
          label: "Action",
        ),
      ],
    );
  }
}

class DividerView extends StatelessWidget {
  const DividerView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 20,
        width: 1,
        color: kMovieInfoTextColor,
      ),
    );
  }
}

class IconAndLabelView extends StatelessWidget {
  final IconData iconData;
  final String label;
  final Color color;

  IconAndLabelView({
    required this.iconData,
    required this.label,
    this.color = kMovieInfoTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          iconData,
          color: color,
          size: 20,
        ),
        SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

class MoviePosterView extends StatelessWidget {
  const MoviePosterView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            "https://m.media-amazon.com/images/I/91caiCtMJfL.jpg",
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 4,
            spreadRadius: 2,
            offset: Offset(1, 4),
          ),
        ],
      ),
    );
  }
}

class AppBarWithBackButtonView extends StatelessWidget {
  const AppBarWithBackButtonView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          AppBarIconView(
            iconData: Icons.arrow_back_ios,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              "Spider Man No Way Home",
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          SizedBox(width: 16),
          AppBarIconView(
            iconData: Icons.favorite_border_rounded,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class AppBarIconView extends StatelessWidget {
  final IconData iconData;
  final Function onTap;

  AppBarIconView({
    required this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onTap();
      },
      icon: Icon(
        iconData,
        color: Colors.white,
      ),
    );
  }
}

class MovieBackgroundImageView extends StatelessWidget {
  const MovieBackgroundImageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.network(
        "https://m.media-amazon.com/images/I/91caiCtMJfL.jpg",
        fit: BoxFit.cover,
      ),
    );
  }
}
