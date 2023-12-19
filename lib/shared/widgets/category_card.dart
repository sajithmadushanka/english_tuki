import 'package:flutter/material.dart';

import '../../user/screens/content_list.dart';
import '../colors.dart';

import '../sizes.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final String url;
  const HomeCard({Key? key, required this.title, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double widgetWidthPercentage = 90;
    double widgetWidth = screenWidth * (widgetWidthPercentage / 100);

    return GestureDetector(
      child: Container(
        width: widgetWidth/2.1,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.primaryColor

        ),
        child: Column(
          children: [
            Container(
              width: widgetWidth / 2.1,
              height: 110,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),

                child: Image.network(
                  url,
                  width: widgetWidth / 2.1,
                  height: 110,
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
                child: Text(title, style: TextStyle(fontFamily: 'primary', fontSize: FontSizes.large,color: AppColors.textColor2),),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ContentList(category: title)));
      }
    );
  }
}
