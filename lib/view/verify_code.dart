import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app1/utils/routes/routes_name.dart';
import 'package:grocery_app1/view_model/auth_provider.dart';
import 'package:provider/provider.dart';

import '../res/components/round_button.dart';
import '../utils/utils.dart';

class VerifyCode extends StatefulWidget {
  dynamic data;
  VerifyCode({required this.data});
  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  @override
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Consumer<AuthProvider1>(
          builder: (context, value, child) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: value.verifyCode,
                  decoration: const InputDecoration(hintText: "6 digit code"),
                ),
                const SizedBox(
                  height: 50,
                ),
                RoundButton(
                  text: "Verify",
                  loading: value.loading,
                  onPress: () async {
                    value.setLoading(true);
                    final credential = PhoneAuthProvider.credential(
                        verificationId: widget.data["verification"],
                        smsCode: value.verifyCode.text.toString().trim());
                    try {
                      await _auth.signInWithCredential(credential);
                      // ignore: use_build_context_synchronously
                      Navigator.pushNamed(context, RoutesName.productList);
                    } catch (e) {
                      value.setLoading(false);
                      Utils.toastMessage(e.toString());
                    }
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
