import 'package:e_commerce_v1/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class productsPage extends StatelessWidget {

  final user = FirebaseAuth.instance.currentUser!;

  void sign_out(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products "),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text("Welcome, you have been logged in as ${user.email}!",
          style: kTextStyle,),
          IconButton(icon: Icon(Icons.logout_sharp,),
          onPressed: sign_out,)
        ],
      ),
    );
  }
}
