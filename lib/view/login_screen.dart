import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app1/utils/routes/routes_name.dart';
import 'package:grocery_app1/view_model/auth_provider.dart';
import 'package:provider/provider.dart';

import '../models/services/verify_goggle.dart';
import '../res/app_string.dart';
import '../res/components/round_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Login"),
          backgroundColor: Colors.purple,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical:30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Consumer<AuthProvider1>(builder: (context, value, child) {
                  return Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/shopping-cart-logoo.png",
                            scale: 4,
                          ),
                          const Text(
                            AppString.welcome,
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w600,
                              fontSize: 28,
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: value.email,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black
                                )
                              ),
                              prefixIcon: Icon(Icons.email),
                              hintText: 'Email',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter email';
                              } else if (!(value.contains("@"))) {
                                return " @ should be used";
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: value.password,
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black
                                )
                              ),
                              prefixIcon: Icon(Icons.lock),
                              hintText: 'Password',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter password';
                              } else if (value.length < 6) {
                                return " Enter at-least 6 digit password";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ],
                      ));
                }),
                const SizedBox(
                  height: 30,
                ),
                Consumer<AuthProvider1>(builder: (context, value, child) {
                  return RoundButton(
                      text: "Login",
                      loading: value.loading,
                      onPress: () {
                        if (_formKey.currentState!.validate()) {
                          value.setLoading(true);
                          value.login(context);
                        }
                      });
                }),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesName.forgetPassword);
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.purple.shade900),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RoutesName.singin);
                        },
                        child: const Text('Sign Up'))
                  ],
                ),
               
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
