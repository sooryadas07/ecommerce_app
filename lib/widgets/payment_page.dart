import 'dart:async';
import 'package:ecommerce_app/custom_navigation_bar.dart';
import 'package:ecommerce_app/widgets/widget_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../home_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
          () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CustomNavigationBar(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Center(
                child: Image.asset("assets/images/payment.png",height: 400,width: 400,),

              ),
            ),
            Center(
              child: WidgetText(
                text: "Yay! Order Received",
                color: Colors.black,
                size: 20,
                weight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
