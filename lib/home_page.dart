import 'package:dio/dio.dart';
import 'package:ecommerce_app/cart_page.dart';
import 'package:ecommerce_app/detail_page.dart';
import 'package:ecommerce_app/favorite_page.dart';
import 'package:ecommerce_app/models/get_categories_model.dart';
import 'package:ecommerce_app/models/get_product_model.dart';
import 'package:ecommerce_app/utiles/constants.dart';
import 'package:ecommerce_app/widgets/carousel_slider_widgets.dart';
import 'package:ecommerce_app/widgets/categorie_widgets.dart';
import 'package:ecommerce_app/widgets/grid_view_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'models/categories_model.dart';
import 'models/get_detail_product.dart';
import 'models/get_detail_product.dart';
import 'models/grid_view_models.dart';

List<ModelCategories> Categorie = [
  ModelCategories(text: "All", image: 'assets/images/s24ultra.png'),
  ModelCategories(text: "phones", image: 'assets/images/iphone16.png'),
  ModelCategories(text: "Laptops", image: 'assets/images/laptop.png'),
  ModelCategories(text: "Electronics", image: 'assets/images/iphone16.png'),
  ModelCategories(text: "Sports", image: 'assets/images/boot.png'),
  ModelCategories(text: "Appliances", image: 'assets/images/Appliances1.png'),
];

class HomePage extends StatefulWidget {
  final Product? productDetail;
  final GetcategoriesModel? categorireModel;
  HomePage({super.key, this.productDetail, this.categorireModel});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Dio dio = Dio();
  GetProductModel? responseModel;
  GetcategoriesModel? categorieModel;
  bool isLoading = true;
  getProduct() async {
    final response = await dio.get(
      "https://dummyjson.com/products",

    );
    if (response.statusCode == 200) {
      // categorieModel = GetcategoriesModel.fromJson(response.data);
      responseModel = GetProductModel.fromJson(response.data);
    }

    setState(() {
      isLoading = false;
    });
  }
  getcategorie() async {
    final response = await dio.get(
      "https://dummyjson.com/products/categories",

    );
    if (response.statusCode == 200) {
      categorieModel = GetcategoriesModel.fromJson(response.data);

    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getProduct();
    getcategorie();
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/images/Lv.png",
            height: 110,
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FavoritePage(),
                        ));
                  },
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.black,
                  ))),
        ],
        title: const Text(
          "Louis Vuitton",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.orange,
            fontSize: 20,
          ),
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              physics: ScrollPhysics(),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          enabled: true,
                          decoration: InputDecoration(
                            hintText: "Search for products",
                            // filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.red),
                            ),
                            suffixIcon: const Icon(
                              Icons.search,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Container(
                          child: CarouselSliderWidgets(),
                          // decoration: BoxDecoration(shape: BoxShape.circle),
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.transparent,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 5),
                            child: Text(
                              "Categories",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            width: 210,
                          ),
                          Text(
                            "See All",
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          physics: PageScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: Categorie.length,
                          shrinkWrap: true,
                          itemBuilder: (context , index) {
                            return CategorieWidgets(
                              image: Categorie[index].image,
                              name: Categorie[index].text,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GridView.builder(
                    physics: PageScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 0.77,
                    ),
                    itemCount: responseModel!.products?.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                    productIndex: index,
                                    productDetail:
                                        responseModel!.products![index],
                                  ),
                                ));
                          },
                          child: GridViewWidgets(
                            productIndex: index,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                      productIndex: index,
                                      productDetail:
                                          responseModel!.products![index],
                                    ),
                                  ));
                            },
                            productData: responseModel!.products![index],
                          ));
                    },
                  )
                ],
              ),
            ),
    );
  }
}
