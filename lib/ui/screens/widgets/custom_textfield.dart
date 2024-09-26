
import 'package:flutter/material.dart';
import 'package:discountnearme/constants.dart';
class CustomTextfield extends StatelessWidget {
  final IconData icon;
  final bool obscureText;
  final String hintText;

  const CustomTextfield({
    Key? key, required this.icon, required this.obscureText, required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          obscureText: obscureText,
          style: TextStyle(
            color: Constants.blackColor,
          ),
          decoration: InputDecoration(
            border: InputBorder.none, // Remove default border
            prefixIcon: Icon(icon, color: Constants.blackColor.withOpacity(.3),),
            hintText: hintText,
          ),
          cursorColor: Constants.blackColor.withOpacity(.5),
        ),
        Container(
          margin: EdgeInsets.only(left: 10.0), // Adjust this to align with prefixIcon
          child: Divider(
            color: Colors.grey.shade300, // Light grey color for the custom border
            thickness: 1, // Border thickness
            indent: 0, // Adjust to reduce starting position (if needed)
            endIndent: 20.0, // This reduces the border length on the right
          ),
        ),
      ],
    );
  }
}