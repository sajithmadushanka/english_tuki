import 'package:english_tuki/shared/services/retrive_data.dart';
import 'package:flutter/cupertino.dart';

import '../models/category.dart';

class AppData {
  static List<CategoryModel>? globalCategoryList;
}

class CategoryDataProvider extends ChangeNotifier {

  fetchData() async {
    GetData.getCategory();
    // Delay the call to notifyListeners() to the next microtask
    await Future.microtask(() {
      notifyListeners();
    });

    // Store the fetched data in the global variable

  }
}
