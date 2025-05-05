import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

class CarouselSliderWidgets extends StatefulWidget {
  const CarouselSliderWidgets({super.key});

  @override
  State<CarouselSliderWidgets> createState() => _CarouselSliderWidgetsState();
}

class _CarouselSliderWidgetsState extends State<CarouselSliderWidgets> {
  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: [
        CarouselSlider(
          items: [

            Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage("https://www.shutterstock.com/image-illustration/discount-upto-50-percent-off-260nw-2512018827.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),


            Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage("https://media.steelseriescdn.com/thumbs/filer_public/43/48/43489212-f952-41d8-bdb2-18fc2bdf7d36/arctis_gamebuds_black_xbox_pdp_img_mobile_wl_speed.png__540x540_crop-scale_optimize_subsampling-2.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),


            Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage("https://cdn.prod.website-files.com/605826c62e8de87de744596e/66b9a6e182d716e727515048_6304972b0f458d536743e9d9_reebok.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage("https://cdn.dribbble.com/users/1233499/screenshots/4437832/attachments/1008071/2.png?resize=400x300&vertical=center"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKM_YG_3ULuGQV8GClWhr1dqzO6Kp0V8ryVVWBXhAQZcWLk9_4qKaV6tTZJgSAfxWwKGI&usqp=CAU"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

          ],

          options: CarouselOptions(
            height: 200.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
        ),
      ],
    );


  }
}
