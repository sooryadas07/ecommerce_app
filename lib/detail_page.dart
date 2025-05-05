import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/cart_page.dart';
import 'package:ecommerce_app/home_page.dart';
import 'package:ecommerce_app/models/get_cart_list_model.dart';
import 'package:ecommerce_app/models/get_detail_product.dart';
import 'package:ecommerce_app/utiles/constants.dart';
import 'package:flutter/material.dart';

import 'models/get_detail_product.dart';
import 'models/get_detail_product.dart';
import 'models/get_product_model.dart';

class DetailPage extends StatefulWidget {
  final Product productDetail;
  final int productIndex;
  const DetailPage(
      {super.key, required this.productIndex, required this.productDetail});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int itemCount = 0;
  Dio dio = Dio();
  GetProductDetailModel? detailProductModel;
  GetCartListModel? cartListModel;
  bool isLoading = true;
  bool isProductInCart = false;
  getDetail() async {
    final response = await dio.get(
      'https://dummyjson.com/products/${widget.productDetail.id}',
    );
    if (response.statusCode == 200) {
      setState(() {
        detailProductModel = GetProductDetailModel.fromJson(response.data);
        cartListModel = GetCartListModel.fromJson(response.data);
        isLoading = false;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getDetail();
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40, left: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          },
                          child: Icon(Icons.arrow_back_ios_new),
                        ),
                      ),
                      Spacer(),
                      // GestureDetector(
                      //                       //   onTap: () {
                      //                       //     setState(() {
                      //                       //       Constants.productList[widget.productIndex]
                      //                       //               .isFavorite =
                      //                       //           !Constants.productList[widget.productIndex]
                      //                       //               .isFavorite;
                      //                       //     });
                      //                       //   },
                      //                       //   child: IconButton(
                      //                       //     onPressed: () {
                      //                       //       setState(() {
                      //                       //         Constants.productList[widget.productIndex]
                      //                       //                 .isFavorite =
                      //                       //             !Constants.productList[widget.productIndex]
                      //                       //                 .isFavorite;
                      //                       //       });
                      //                       //     },
                      //                       //     icon: Padding(
                      //                       //       padding: EdgeInsets.only(top: 40),
                      //                       //       child: Icon(
                      //                       //         Constants.productList[widget.productIndex]
                      //                       //                 .isFavorite
                      //                       //             ? Icons.favorite_rounded
                      //                       //             : Icons.favorite_border,
                      //                       //         color: Constants.productList[widget.productIndex]
                      //                       //                 .isFavorite
                      //                       //             ? Colors.red
                      //                       //             : Colors.black,
                      //                       //       ),
                      //                       //     ),
                      //                       //   ),
                      //                       // ),
                    ],
                  ),
                  SizedBox(height: 50),
                  CarouselSlider.builder(
                    itemCount: detailProductModel!.images?.length,
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(
                                widget.productDetail.images?[0] ?? ""),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: 340.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      widget.productDetail.brand ?? "",
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Icon(
                          Icons.star,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        widget.productDetail.rating.toString() ?? "",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),Padding(
                    padding: const EdgeInsets.only(right:245),
                    child: Text(
                      widget.productDetail.warrantyInformation.toString() ?? "",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      widget.productDetail.description.toString() ?? "",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ), Row(
                    children: [SizedBox(width: 15,height: 30,),
                      Text(
                        "Shipping Information :",style: TextStyle(color: Colors.green),
                      ),  Text(
                        widget.productDetail.shippingInformation.toString() ?? "",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 170,
                          color: Colors.white,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 40),
                              child: Text(
                                "\$ ${widget.productDetail.price.toString() ?? " "}",
                                style:
                                    TextStyle(color: Colors.black, fontSize: 30),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            bool productExists = false;
                            for (int i = 0; i < Constants.checkOutList.length; i++) {
                              if (Constants.checkOutList[i].id ==
                                  widget.productDetail.id) {
                                Constants.checkOutList[i].itemCount =
                                    (Constants.checkOutList[i].itemCount! + 1);
                                productExists = true;
                                break;
                              }
                            }
                            if (!productExists) {
                              Constants.checkOutList.add(GetCartListModel(
                                  images: widget.productDetail.images,
                                  title: widget.productDetail.title,
                                  price: widget.productDetail.price,
                                  itemCount: 1,
                                  id: widget.productDetail.id));
                            }

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CartPage(),
                              ),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                "Add to cart",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

