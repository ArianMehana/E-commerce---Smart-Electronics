import 'package:flutter/material.dart';

import '../constants.dart';

class loginButton extends StatelessWidget {
   loginButton({required this.onPressed, required this.text});

  final Function()? onPressed;
  String text = "";

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed,
      child: Text("$text", style: kContinueButtonStyle,),
      style: TextButton.styleFrom(
          backgroundColor: Colors.deepOrangeAccent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
      ),);
  }
}



