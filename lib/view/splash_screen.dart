import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app1/models/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SplashServices().isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/splash_screen_shopping.gif"),
              const Text(
        "Grocery app",
        style: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
      ),
            ],
          )),
    );
  }
}
