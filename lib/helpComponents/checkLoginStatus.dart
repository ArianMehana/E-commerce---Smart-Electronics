import 'package:e_commerce_v1/logins/login.dart';
import 'package:e_commerce_v1/products.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class checkLoginState extends StatelessWidget {
  const checkLoginState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData)
            {
        return productsPage();
            }
          else
            {
          return logInPage();
            }
        },
      ),
    );
  }
}
