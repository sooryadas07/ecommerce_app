import 'package:ecommerce_app/detail_page.dart';
import 'package:ecommerce_app/home_page.dart';
import 'package:ecommerce_app/newpage.dart';
import 'package:flutter/material.dart';

import 'favorite_page.dart';
import 'login_page.dart';

class CustomNavigationBar extends StatefulWidget {

  const CustomNavigationBar({super.key, });

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int pageIndex = 1;


  final pages = [LoginPage(), HomePage(),FavoritePage(),Newpage(),LoginPage(),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: pages[pageIndex],
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white30,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 15,
            ),
            IconButton(enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
                icon: pageIndex == 1 ? Icon(Icons.home_filled):Icon(Icons.home_outlined)
            ),
            SizedBox(
              width: 20,
            ),
            IconButton(enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              icon: pageIndex==3?Icon(Icons.search):Icon(Icons.search_outlined)
            ),
            SizedBox(
              width: 25,
            ),
            IconButton(enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              icon:pageIndex==3?Icon(Icons.add_box):Icon(Icons.add_box_outlined)
            ),
            SizedBox(
              width: 25,
            ),
            IconButton(enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon:pageIndex==2?Icon(Icons.favorite):Icon(Icons.favorite_border)
            ),
            SizedBox(
              width: 25,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              icon:pageIndex==3 ? Icon(Icons.person) :Icon(Icons.person_2_outlined)
            ),
          ],
        ),
      ),
    );
  }
}
