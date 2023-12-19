
import 'package:english_tuki/shared/base_assets_url.dart';
import 'package:english_tuki/shared/colors.dart';
import 'package:english_tuki/shared/sizes.dart';
import 'package:english_tuki/shared/widgets/category_card.dart';

import 'package:english_tuki/user/screens/login.dart';
import 'package:english_tuki/user/screens/suggestion_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/models/category.dart';
import '../../shared/services/provider.dart';
import '../../shared/services/retrive_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  late Future<List<CategoryModel>?>? dataFuture;
  List<CategoryModel>? cato; // Store the fetched data
  @override
  void initState()  {
    super.initState();
    if (cato == null) {
      // Fetch data only if it hasn't been fetched before
      dataFuture = GetData.getCategory();
      print("Fetching data..............");

    }

  }



  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;
    // Set the percentage of screen width you want to use
    double widgetWidthPercentage = 90; // Adjust as needed
    // Calculate the actual widget width
    double widgetWidth = screenWidth * (widgetWidthPercentage / 100);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor2,
      appBar: AppBar(
        backgroundColor: AppColors.borderColor1,
        title:
          Container(

            width: widgetWidth,
            decoration: const BoxDecoration(
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Image.asset(
                    "${ImagePath.images}logo-1.png",
                    width: 150,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child:Text('Login',
                  style: TextStyle(fontFamily:'primary',
                      fontSize:FontSizes.large, fontWeight:FontWeight.bold,
                      color:AppColors.textColor2),
                  ),
                ),
              ],),
          ),
      ),

      body: Center(
        child: SizedBox(
          width: widgetWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Center(
                child: Text('Vocabulary',
                  style: TextStyle(fontFamily:'primary',
                      fontSize:FontSizes.exLarge, fontWeight:FontWeight.bold,
                      color:AppColors.textColor2),),
              ),
             FutureBuilder(
               future:dataFuture,
               builder: (context, snapshot) {
                 if (snapshot.connectionState == ConnectionState.waiting) {
                   return const CircularProgressIndicator(color: Colors.white);
                 } else if (snapshot.hasError) {
                   return Text('Error: ${snapshot.error}');
                 } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                   return const Text('No data available');
                 }
                 else{
                   cato = snapshot.data;
                   return
                     Column(
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             HomeCard(title: cato![0].title, url: cato![0].imgUrl),
                             HomeCard(title: cato![1].title, url: cato![1].imgUrl),

                           ],
                         ),
                        const SizedBox(height: 12),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             HomeCard(title: cato![2].title, url: cato![2].imgUrl),
                             HomeCard(title: cato![3].title, url: cato![3].imgUrl),

                           ],
                         ),
                       ],
                     );
                 }

               },

             ),

              GestureDetector(
                child: Container(
                  width: widgetWidth - 50,
                  height: 50,
                  decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.borderColor1.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 2), // changes position of shadow
                          ),
                        ],
                  ),
                  child: Center(
                    child: Text("Send Suggestions",
                      style: TextStyle(fontFamily:'primary',
                          fontSize:FontSizes.exLarge, fontWeight:FontWeight.bold,
                          color:AppColors.textColor2),
                    ),
                  ),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SuggestionForm()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
