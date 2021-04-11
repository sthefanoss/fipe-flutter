import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    this.hintText,
    this.controller,
  });

  final controller;
  final hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(4)),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: Colors.black,
        ),
        decoration: InputDecoration.collapsed(
          hintText: hintText,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Color(0xFF595959),
          ),
        ),
      ),
    );
  }
}
