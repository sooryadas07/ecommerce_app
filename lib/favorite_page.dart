import 'package:ecommerce_app/home_page.dart';
import 'package:ecommerce_app/utiles/constants.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final favoriteList = Constants.productList.where((item) => item.isFavorite).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: favoriteList.isEmpty
          ? Center(
        child: Text(
          "Your favorites list is empty!",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      )
          : ListView.builder(
        itemCount: favoriteList.length,
        itemBuilder: (context, index) {
          final item = favoriteList[index];
          return Card(
            elevation: 5,
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Image.network(
                item.image.isNotEmpty ? item.image[0] : "",
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              title: Text(item.text),
              subtitle: Text("\$${item.price}"),
              trailing: IconButton(
                icon: Icon(Icons.favorite, color: Colors.red),
                onPressed: () {
                  setState(() {
                    item.isFavorite = false;
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
