import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.textButton, this.onPressed});
  String? textButton;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed, child: Text(textButton ?? 'text'));
  }
}
