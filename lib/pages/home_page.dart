// Stateless
import 'package:film_ku/pages/movie_detail_page.dart';
import 'package:film_ku/resources/colors.dart';
import 'package:film_ku/resources/dummy_data.dart';
import 'package:film_ku/viewitems/movie_view.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(
          Icons.menu,
        ),
        title: Text(
          "FilmKu",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Icon(
            Icons.notifications,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BannerSectionView(),
            SizedBox(height: 16),
            RecommendedForYouSectionView(),
            SizedBox(height: 16),
            MoviesByCategorySectionView(),
          ],
        ),
      ),
    );
  }
}

class MoviesByCategorySectionView extends StatelessWidget {
  const MoviesByCategorySectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleView(title: "Categories"),
        SizedBox(height: 16),
        CategoryTabBarView(),
        SizedBox(height: 16),
        HorizontalMovieListView(),
      ],
    );
  }
}

class CategoryTabBarView extends StatelessWidget {
  const CategoryTabBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10,
      child: TabBar(
        isScrollable: true,
        dividerHeight: 0,
        indicatorColor: kHighlightColor,
        tabAlignment: TabAlignment.start,
        labelColor: kHighlightColor,
        tabs: categoryList.map((String category) {
          return Tab(
            child: Text(category),
          );
        }).toList(),
      ),
    );
  }
}

class RecommendedForYouSectionView extends StatelessWidget {
  const RecommendedForYouSectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleView(title: "Recommended for you"),
        SizedBox(height: 16),
        HorizontalMovieListView(),
      ],
    );
  }
}

class HorizontalMovieListView extends StatelessWidget {
  const HorizontalMovieListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return MovieView(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailPage(),
                ),
              );
            },
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 16);
        },
      ),
    );
  }
}

class TitleView extends StatelessWidget {
  final String title;

  TitleView({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          Text(
            "See All",
            style: TextStyle(
              color: kHighlightColor,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class BannerSectionView extends StatefulWidget {
  const BannerSectionView({
    super.key,
  });

  @override
  State<BannerSectionView> createState() => _BannerSectionViewState();
}

class _BannerSectionViewState extends State<BannerSectionView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 1 / 3,
          child: PageView(
            onPageChanged: (int pageIndex) {
              setState(() {
                currentIndex = pageIndex;
              });
              print("Current Index =====> $currentIndex");
            },
            children: [
              BannerImageView(),
              BannerImageView(),
              BannerImageView(),
              BannerImageView(),
            ],
          ),
        ),
        SizedBox(height: 12),

        /// Page Indicator
        AnimatedSmoothIndicator(
          activeIndex: currentIndex,
          count: 4,
          effect: ExpandingDotsEffect(
            dotHeight: 10,
            dotWidth: 10,
            activeDotColor: Color.fromRGBO(21, 205, 218, 1.0),
          ),
        ),
      ],
    );
  }
}

class BannerImageView extends StatelessWidget {
  const BannerImageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.network(
            "https://thanhnien.mediacdn.vn/Uploaded/dotuan/2022_11_10/1-5451.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Black Panther: Wakanda Forever",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "On March 2, 2022",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

/// Image Type 2
/// Asset Image
/// Network Image
/// https://thanhnien.mediacdn.vn/Uploaded/dotuan/2022_11_10/1-5451.jpg
