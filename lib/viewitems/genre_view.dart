import 'package:film_ku/resources/colors.dart';
import 'package:flutter/material.dart';

class GenreView extends StatelessWidget {
  const GenreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: kGenreBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        "2 Trailers",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
