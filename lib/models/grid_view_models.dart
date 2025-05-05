import 'package:flutter/cupertino.dart';

class ModelGridview {
  late int itemCount;
  final String id;
  final bool ShouldVisible;

  final List<String> image;
  final String text;
  final String price;
  final String rating;
  bool isFavorite;

  ModelGridview({
    required this.image,
    required this.price,
    required this.text,
    required this.rating,
    required this.ShouldVisible,
    required this.itemCount,
    required this.id,
    required this.isFavorite,
  });
}
