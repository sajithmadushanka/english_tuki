
import 'package:english_tuki/user/screens/content_list.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../sizes.dart';

class MainCard extends StatefulWidget {
  final String title;
  final String url;
  const MainCard({super.key, required this.title, required this.url});

  @override
  State<MainCard> createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double widgetWidthPercentage = 90;
    double widgetWidth = screenWidth * (widgetWidthPercentage / 100);
    return Container(
      width: widgetWidth -50,
      height: 200,
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.primaryColor

      ),
      child: Column(
        children: [
          Container(
            width: widgetWidth -50,
            height: 150,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),

              child: Image.network(
                widget.url,
                width: widgetWidth -50,
                height: 150,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    // If the image has finished loading, return the child widget
                    return child;
                  } else {
                    // If the image is still loading, return a progress indicator
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: Center(
              child: Text(widget.title,
                style: TextStyle(fontFamily: 'primary', fontSize: FontSizes.exLarge,color: AppColors.textColor2),),
            ),
          ),
        ],
      ),
    );
  }
}
