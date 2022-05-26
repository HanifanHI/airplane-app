import 'package:flutter/material.dart';

import '/shared/theme.dart';

class CustomTextFormField extends StatelessWidget {
  // * ATRIBUTE
  final String title;
  final String hintText;
  final bool isObscureText;
  final TextEditingController controller;

  // * CONSTRUCTOR
  CustomTextFormField({
    required this.title,
    required this.hintText,
    this.isObscureText = false,
    required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: regular,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          TextFormField(
            obscureText: isObscureText,
            cursorColor: kBlackColor,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  defaultRadius,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
                borderSide: BorderSide(
                  color: kPrimaryColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
