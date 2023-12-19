import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_tuki/shared/models/category.dart';

class GetData {
  static List<CategoryModel> categoryModelList = [];

  static Future<List<CategoryModel>?> getCategory() async {
    try {
      final dataRef = FirebaseFirestore.instance.collection('data');
      final dataSnapshot = await dataRef.get();

      for (var document in dataSnapshot.docs) {
        Map<String, dynamic> category = document.data();
        CategoryModel categoryModel = CategoryModel(title: category['title'], imgUrl: category['img_url']);

        categoryModelList.add(categoryModel);

        // Accessing value using the key 'img_url'
        //  String imgUrl = category['img_url'];
        //  print('Image URL: ${categoryModel.title}');
      }

      return categoryModelList;
    } catch (e) {
      print('Error fetching category data: $e');
      return null;
    }
  }
}
