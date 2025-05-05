import 'package:ecommerce_app/detail_page.dart';
import 'package:ecommerce_app/models/get_product_model.dart';
import 'package:ecommerce_app/utiles/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home_page.dart';

class GridViewWidgets extends StatefulWidget {
  final Product productData;
  final int? productIndex;
  final Function onTap;
  GridViewWidgets(
      {super.key,
      required this.productIndex,
      required this.onTap,
      required this.productData});

  @override
  State<GridViewWidgets> createState() => _GridViewWidgetsState();
}

class _GridViewWidgetsState extends State<GridViewWidgets> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 150,
            child: Container(
              height: 170,
              width: 150,
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 10,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image(
                    image: NetworkImage(
                      widget.productData.images?[0] ?? "",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            widget.productData.brand ?? "",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 2,
          ),
          Text("\$ ${widget.productData.price.toString() ?? ""}"),
        ],
      ),
    );
  }
}
