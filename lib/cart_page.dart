import 'package:ecommerce_app/home_page.dart';
import 'package:ecommerce_app/utiles/constants.dart';
import 'package:ecommerce_app/widgets/add_to_cart_widget.dart';
import 'package:ecommerce_app/widgets/payment_page.dart';
import 'package:ecommerce_app/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late Razorpay razorpay;
  double totalPrice = 0;
  double gst = 0;

  @override
  void initState() {
    super.initState();
    initializeItemCounts();
    calculateTotal();
    razorpay = Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, paymentSuccessHandler);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, paymentErrorHandler);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, externalWalletHandler);
  }

  void initializeItemCounts() {
    for (var item in Constants.checkOutList) {
      if (item.itemCount == 0) {
        item.itemCount = 1;
      }
    }
  }

  void launchPayment() async {
    var options = {
      "key": "rzp_test_waeUUkXGdhnmoe",
      "amount": ((totalPrice + gst) * 100).toInt(),
      "name": "Lv",
      "description": "Payment for cart items",
      "currency": "INR",
      "prefill": {
        "contact": "",
        "email": "test@abc.com",
      }
    };
    try {
      razorpay.open(options);
    } catch (e) {
      print("Error opening Razorpay: $e");
    }
  }

  void externalWalletHandler(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: WidgetText(
        text: 'External wallet used: ${response.walletName}',
        color: Colors.white,
        size: 20,
        weight: FontWeight.bold,
      ),
      backgroundColor: Colors.green,
    ));
  }

  void paymentErrorHandler(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: WidgetText(
        text: response.message ?? 'Payment error',
        color: Colors.white,
        size: 10,
        weight: FontWeight.bold,
      ),
      backgroundColor: Colors.red,
    ));
  }

  void paymentSuccessHandler(PaymentSuccessResponse response) {
    Constants.checkOutList.clear();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const PaymentPage(),
      ),
    );
  }

  void calculateTotal() {
    totalPrice = 0;
    for (var index = 0; index < Constants.checkOutList.length; index++) {
      totalPrice += Constants.checkOutList[index].price! *
          Constants.checkOutList[index].itemCount!;
    }
    gst = totalPrice * 0.18;
  }

  @override
  void dispose() {
    razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 10),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 90, top: 40),
                child: Text(
                  "My Cart",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: Constants.checkOutList.length,
              itemBuilder: (context, index) {
                return CartProductWidget(
                  productIndex: index,
                  index: index,
                  onRemove: () {
                    setState(() {
                      Constants.checkOutList.removeAt(index);
                      calculateTotal();
                    });
                  },
                  increment: () {
                    setState(() {
                      Constants.checkOutList[index].itemCount =
                          Constants.checkOutList[index].itemCount! + 1;
                      calculateTotal();
                    });
                  },
                  decrement: () {
                    setState(() {
                      if (Constants.checkOutList[index].itemCount! > 1) {
                        Constants.checkOutList[index].itemCount =
                            Constants.checkOutList[index].itemCount! - 1;
                        calculateTotal();
                      }
                    });
                  },
                  itemCount: Constants.checkOutList[index].itemCount!,
                );
              },
            ),
          ),
          if (Constants.checkOutList.isNotEmpty)
            Container(
              color: Colors.white,
              padding:  EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15)),
                    ),
                    builder: (context) => Container(
                      padding: EdgeInsets.all(20.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(15)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Subtotal: ₹${totalPrice.toStringAsFixed(2)}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text("GST        : ₹${gst.toStringAsFixed(2)}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          const Divider(),
                          Text(
                              "Total Price: ₹${(totalPrice + gst).toStringAsFixed(2)}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          GestureDetector(
                            onTap: launchPayment,
                            child: Container(
                              width: 350,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  "Pay Now",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 360,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "Proceed to Pay",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
