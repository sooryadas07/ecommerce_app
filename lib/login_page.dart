import 'package:ecommerce_app/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _HomePageState();
}

class _HomePageState extends State<LoginPage> {
  bool isPasswordObsecure = true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: const Text(
          "E-commerce ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/white"
                    ".jpg"),
                fit: BoxFit.cover)),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 0,
                      left: 40,
                      right: 40,
                    ),
                    child: Text(
                      "Log in",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  TextWidgets(
                    text: "user name",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextWidgets(obsecureText: isPasswordObsecure,
                    text: "pass word",
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordObsecure = !isPasswordObsecure;
                          });
                        },
                        icon: Icon(isPasswordObsecure
                            ? Icons.visibility_off
                            : Icons.visibility)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70),
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot Password",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                        ),
                        SizedBox(width: 10),
                        // Icon(Icons.messenger,color: Colors.red,),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Already Have an Account ?",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Row(
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: TextButton(onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                            }, child: Text("Log in google",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15,color:Colors.black),))),
                        IconButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                        }, icon: Icon(Icons.g_mobiledata_rounded,color: Colors.red,size: 40,))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
