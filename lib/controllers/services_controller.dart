import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:love_and_marry_app/models/suppliers_model.dart';

class ServiceController extends GetxController{

  var subcat =[];
  getSubCategories(title) async {
    subcat.clear();
    var data = await rootBundle.loadString("lib/services/suppliers_model.json");
    var decoded = suppliersModelFromJson(data);
    var s = decoded.suppliers.where((element) => element.name == title).toList();

    for (var e in s[0].subcategory) {
      subcat.add(e);

    }

  }
}