// To parse this JSON data, do
//
//     final suppliersModel = suppliersModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SuppliersModel suppliersModelFromJson(String str) => SuppliersModel.fromJson(json.decode(str));

String suppliersModelToJson(SuppliersModel data) => json.encode(data.toJson());

class SuppliersModel {
  List<Supplier> suppliers;

  SuppliersModel({
    required this.suppliers,
  });

  factory SuppliersModel.fromJson(Map<String, dynamic> json) => SuppliersModel(
    suppliers: List<Supplier>.from(json["suppliers"].map((x) => Supplier.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "suppliers": List<dynamic>.from(suppliers.map((x) => x.toJson())),
  };
}

class Supplier {
  String name;
  List<String> subcategory;

  Supplier({
    required this.name,
    required this.subcategory,
  });

  factory Supplier.fromJson(Map<String, dynamic> json) => Supplier(
    name: json["name"],
    subcategory: List<String>.from(json["subcategory"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "subcategory": List<dynamic>.from(subcategory.map((x) => x)),
  };
}
