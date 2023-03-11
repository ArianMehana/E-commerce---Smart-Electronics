import 'package:e_commerce_v1/constants.dart';
import 'package:e_commerce_v1/helpComponents/loginButton.dart';
import 'package:e_commerce_v1/helpComponents/textFields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class registerPage extends StatefulWidget {


  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
        text: "You have succesfully registered");
  }

  //this neat litte code replaces all previous error messages

  Future<void> showErrorDialog( String message) async {
    await Future.delayed(Duration(milliseconds: 1000));
    QuickAlert.show(context: context,
        type: QuickAlertType.error,
        title: "Error",
        text: message);
  }

  void sign_up() async{

    try {
      if(passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text);
      }
      else {
        showErrorDialog("Passwords don't match!");
      }
    } on FirebaseAuthException catch (e) {
      showErrorDialog(e.code);
    }
    succesfulLogin();
    await Future.delayed(Duration(milliseconds: 1200));
    Navigator.pushNamed(context, "/products");
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
                Text("Welcome", style: kTextStyle,),
                Text("Please sign-up to continue!", style: kTextStyle,)
              ],
            ),
            //Username/Email field
            MyTextField(controller: emailController, hintText: "Email", obscureText: false),


            //Password
            MyTextField(controller: passwordController, hintText: "Password", obscureText: true),

            //confirm Password
            MyTextField(controller: confirmPasswordController, hintText: "Confirm Password", obscureText: true),

            // Log in Button
            SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: loginButton(
                    text: "Sign up",
                  onPressed: sign_up,),
                )),

            //Register or Sign Up instead
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                TextButton(onPressed: (){
                  Navigator.pushNamed(context, "/screen1");
                },
                    child: Text("Log in instead!")),
              ],
            ),
            SizedBox(width: 25.0,),
          ],
        ),
      ),
    );
  }
}
