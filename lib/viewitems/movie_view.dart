import 'package:flutter/material.dart';

class MovieView extends StatelessWidget {

  final Function onTap;


  MovieView({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 130,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                "https://www.ubuy.vn/productimg/?image=aHR0cHM6Ly9pLmViYXlpbWcuY29tL2ltYWdlcy9nL1hPRUFBT1N3bE5kaHJYZ0Mvcy1sNTAwLndlYnA.jpg",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 12),
            Text(
              "Spiderman: No Way Home",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: 20,
                ),
                SizedBox(width: 8),
                Text(
                  "9.1/10 IMDb",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
