import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app1/utils/routes/routes_name.dart';
import 'package:grocery_app1/view/cart_screen.dart';
import 'package:grocery_app1/view/forget_password_Screen.dart';
import 'package:grocery_app1/view/login_screen.dart';
import 'package:grocery_app1/view/login_with_PhoneNumber.dart';
import 'package:grocery_app1/view/product_list_screen.dart';
import 'package:grocery_app1/view/splash_screen.dart';
import 'package:grocery_app1/view/verify_code.dart';
import '../../view/signin_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.productList:
        return MaterialPageRoute(
            builder: (BuildContext context) => ProductListView());
      case RoutesName.cartList:
        return MaterialPageRoute(
            builder: (BuildContext context) => CartScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen());
      case RoutesName.singin:
        return MaterialPageRoute(
            builder: (BuildContext context) => SigninScreen());
      case RoutesName.loginPhone:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginWithPhone());
      case RoutesName.verifyCode:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                VerifyCode(data: settings.arguments as Map));
      case RoutesName.splashScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => SplashScreen());
      case RoutesName.forgetPassword:
        return MaterialPageRoute(
            builder: (BuildContext context) => ForgetScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text("No routes are there"),
            ),
          );
        });
    }
  }
}
