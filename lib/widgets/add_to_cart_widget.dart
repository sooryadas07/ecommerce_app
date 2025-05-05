import 'package:dio/dio.dart';
import 'package:ecommerce_app/favorite_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/get_product_model.dart';
import '../utiles/constants.dart';

class CartProductWidget extends StatefulWidget {
  final VoidCallback increment;
  final VoidCallback decrement;
  final int itemCount;
  final int index;
  final int productIndex;
  final Function onRemove;

  const CartProductWidget({
    super.key,
    required this.productIndex,
    required this.index,
    required this.onRemove,
    required this.increment,
    required this.decrement,
    required this.itemCount,
  });

  @override
  State<CartProductWidget> createState() => _CartProductWidgetState();
}

class _CartProductWidgetState extends State<CartProductWidget> {
  void showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text("Remove Item"),
          content: Text("Are you sure you want to remove this item from the cart?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                widget.onRemove();
              },
              child: const Text(
                "Remove",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Card(color:Colors.white ,
      elevation: 5,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(
              image: NetworkImage(
                (Constants.checkOutList[widget.index].images!.isNotEmpty)
                    ? Constants.checkOutList[widget.index].images![0]
                    : "",
              ),
              width: 150,
              height: 150,
            ),
          ),
          SizedBox(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  text: TextSpan(
                      text: Constants.checkOutList[widget.index].title,
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      text: TextSpan(
                        text: "\$${Constants.checkOutList[widget.index].price.toString()}",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: IconButton(
                        onPressed: widget.decrement,
                        icon: Icon(Icons.remove_circle),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('${widget.itemCount}'),
                    Flexible(
                      child: IconButton(
                        onPressed: widget.increment,
                        icon: Icon(Icons.add_circle),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => showDeleteConfirmationDialog(context),
                      child:  Icon(Icons.delete_outline_rounded, color: Colors.black),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
