import 'package:e_commerce_v1/constants.dart';
import 'package:e_commerce_v1/helpComponents/checkLoginStatus.dart';
import 'package:e_commerce_v1/logins/login.dart';
import 'package:e_commerce_v1/logins/registerPage.dart';
import 'package:e_commerce_v1/products.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp() ,
  ));
}

class welcomeScreen extends StatelessWidget {
  const welcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Smart Electronics"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text("Smart Electronics", style: kTitleStyle),
          ),
          Text("Welcome to Smart Electronics",style: kNormalStyle),
          Image(image: AssetImage("images/welcomeImage.webp"),
          height: 200,
          width: double.infinity,),
          SizedBox(
            width: double.infinity,
            child: TextButton(onPressed: (){
              //Navigator here
              Navigator.pushNamed(context, "/auth");
            },
            child: Text("Continue", style: kContinueButtonStyle,),
            style: TextButton.styleFrom(
              backgroundColor: Colors.deepOrangeAccent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
            ),),
          )
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      routes: {
        "/home" :(context) => welcomeScreen(),
        "/auth" : (context) => checkLoginState(),
        "/screen1" : (context) => logInPage(),
        "/screen2" : (context) => registerPage(),
        "/products" : (context) => productsPage(),
      },
    );
  }
}



