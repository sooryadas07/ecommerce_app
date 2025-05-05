// To parse this JSON data, do
//
//     final getcategoriesModel = getcategoriesModelFromJson(jsonString);

import 'dart:convert';

List<GetcategoriesModel> getcategoriesModelFromJson(String str) => List<GetcategoriesModel>.from(json.decode(str).map((x) => GetcategoriesModel.fromJson(x)));

String getcategoriesModelToJson(List<GetcategoriesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetcategoriesModel {
  final String? slug;
  final String? name;
  final String? url;

  GetcategoriesModel({
    this.slug,
    this.name,
    this.url,
  });

  factory GetcategoriesModel.fromJson(Map<String, dynamic> json) => GetcategoriesModel(
    slug: json["slug"],
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "slug": slug,
    "name": name,
    "url": url,
  };
}
