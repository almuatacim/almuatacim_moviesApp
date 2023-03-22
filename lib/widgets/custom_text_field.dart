import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({this.hitnText, this.isPass = false, this.onChanged});
  String? hitnText;
  bool isPass;
  void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
        onChanged: onChanged,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          label: Text(
            hitnText ?? '',
            style: TextStyle(color: Colors.white),
          ),
          hintText: 'Enter your $hitnText',
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        obscureText: isPass);
  }
}
