import 'package:english_tuki/shared/services/vocobulary/fruits.dart';
import 'package:english_tuki/shared/services/vocobulary/technology.dart';
import 'package:english_tuki/shared/services/vocobulary/vegetables.dart';
import 'package:english_tuki/shared/widgets/main_card.dart';
import 'package:flutter/material.dart';

import '../../shared/base_assets_url.dart';
import '../../shared/colors.dart';
import '../../shared/models/vocabulary_card.dart';
import '../../shared/services/vocobulary/animals.dart';
import '../../shared/sizes.dart';
import 'home.dart';
class ContentList extends StatefulWidget {
  final String category;
  const ContentList({super.key, required this.category});

  @override
  State<ContentList> createState() => _ContentListState();
}

class _ContentListState extends State<ContentList> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  late Future<List<VocabularyCard>?>? futureData;
  getData() {
    switch (widget.category.trim()) {
      case "Animals":
        futureData = AnimalData.accessListSubCollection();
        break;
      case "Vegetables":
        futureData = VegetableData.accessListSubCollection();
        break;
      case "Fruits":
        {
          futureData = FruitsData.accessListSubCollection();
        }
        break;
      case "Technology":
        futureData = TechData.accessListSubCollection();
        break;
      default :
        print('no data list');
    }
  }
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double widgetWidthPercentage = 90;
    double widgetWidth = screenWidth * (widgetWidthPercentage / 100);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor1,
      appBar: AppBar(
        backgroundColor: AppColors.borderColor1,
        // title:   Image.asset("${ImagePath.images}logo-1.png", width: 180,),
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>
            const HomeScreen()),
                  (route) => false,
            );
          },
          icon: Icon(Icons.home, color: Colors.white,),
        ),
        title:
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Image.asset(
                  "${ImagePath.images}logo-1.png",
                  width: 150,
                ),
              ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: TextButton(
              onPressed: () {
                // Handle button press
              },
              child:Text('Login',
                style: TextStyle(fontFamily:'primary',
                    fontSize:FontSizes.large, fontWeight:FontWeight.bold,
                    color:AppColors.textColor2),
              ),
            ),
          ),
        ],
      ),

      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 20),
          width: widgetWidth - 50,
            child:FutureBuilder(
             future: futureData,
              builder: (context, snapshot,) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return  SizedBox(
                      child: LinearProgressIndicator(
                        color: AppColors.primaryColor,
                      ));
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('No data available');
                }
                List<VocabularyCard>? data = snapshot.data;
                return ListView.builder(
                  itemCount: data!.length,
                itemBuilder: (context, index) {
                            if (data == null || data.isEmpty) {
                            return const Text('No data available');
                            }
                            return MainCard(title: data[index].name, url: data[index].imgUrl);
                               }
                            );
             }),
            ),
        ),
    );
  }
}
