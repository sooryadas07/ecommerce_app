import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/get_cart_list_model.dart';
import '../models/get_categories_model.dart';
import '../models/get_detail_product.dart';
import '../models/get_product_model.dart';

class CategorieWidgets extends StatefulWidget {
  final GetcategoriesModel? caregorieModel;
  // final int productIndex;
  final int? index;
  final String image;
  final String name;
  CategorieWidgets(
      {super.key,
       this.index,
      required this.image,
        required this.name, this.caregorieModel,});

  @override
  State<CategorieWidgets> createState() => _CategorieWidgetsState();
}

class _CategorieWidgetsState extends State<CategorieWidgets> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(3.0),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blueGrey,
              backgroundImage: AssetImage(widget.image),
            )),
        SizedBox(
          height: 5,
        ),
        Text(widget.name),
      ],
    );
  }
}
