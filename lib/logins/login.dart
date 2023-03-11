import 'package:e_commerce_v1/constants.dart';
import 'package:e_commerce_v1/helpComponents/loginButton.dart';
import 'package:e_commerce_v1/helpComponents/textFields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class logInPage extends StatefulWidget {


  @override
  State<logInPage> createState() => _logInPageState();
}

class _logInPageState extends State<logInPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool? remember = false;
  
  // Future<void> wrongEmailDialog() async {
  //   await Future.delayed(Duration(milliseconds: 1000));
  //   QuickAlert.show(context: context, type: QuickAlertType.error,
  //   title: "Wrong Email",
  //   text: "Please enter your email correctly");
  // }
  //
  // Future<void> wrongPasswordDialog() async {
  //   await Future.delayed(Duration(milliseconds: 1000));
  //   QuickAlert.show(context: context, type: QuickAlertType.error,
  //   title: "Wrong Password",
  //   text: "Please enter your password correctly");
  // }
  // Future<void> tooManyRequest() async {
  //   await Future.delayed(Duration(milliseconds: 1000));
  //   QuickAlert.show(context: context, type: QuickAlertType.error,
  //   title: "Too many requests",
  //   text: "Please try again later");
  // }

  Future<void> succesfulLogin() async {
    await Future.delayed(Duration(milliseconds: 1000));
    QuickAlert.show(context: context,
        type: QuickAlertType.success,
    title: "Success",
    text: "You have succesfully logged in");
  }

  //this neat litte code replaces all previous error messages

  Future<void> showErrorDialog( String message) async {
    await Future.delayed(Duration(milliseconds: 1000));
    QuickAlert.show(context: context,
        type: QuickAlertType.error,
    title: "Error",
    text: message);
  }

  void sign_in() async{

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text);
    } on FirebaseAuthException catch (e) {
        showErrorDialog(e.code);
    }
    succesfulLogin();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox( width: 25.0,),
            Center(
              child: Icon(Icons.lock,
              size: 100,),
            ),
            Column(
              children: [
                Text("Welcome back", style: kTextStyle,),
                Text("Please log-in to continue!", style: kTextStyle,)
              ],
            ),
            //Username/Email field
            MyTextField(controller: emailController, hintText: "Email", obscureText: false),


            //Password/Email
            MyTextField(controller: passwordController, hintText: "Password", obscureText: true),

            //Forgot Password TextButton?
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(),
                  Checkbox(value: remember, onChanged: (value){
                    this.setState(() {
                      remember = value;
                    });
                  }),
                  Text("Remember me"), //remembers credentials
                  SizedBox(width: 100,),
                  TextButton(onPressed: (){}, //leads to a forgot password screen
                      child: Text("Forgot Password?") ),
                ],
              ),
            ),

            // Log in Button
            SizedBox(
              width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: loginButton(
                    text: "Sign in",
                    onPressed: sign_in,),
                )),

            //Register or Sign Up instead
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Dont have an account?"),
                TextButton(onPressed: (){
                  Navigator.pushNamed(context, "/screen2");
                },
                    child: Text("Sign up!")),
              ],
            ),
            SizedBox(width: 25.0,),
          ],
        ),
      ),
    );
  }
}
