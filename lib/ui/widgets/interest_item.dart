import 'package:flutter/material.dart';

import '/shared/theme.dart';

class InterestItem extends StatelessWidget {
  // * ATRIBUTE
  final String text;
  // * CONSTRUCTOR
  InterestItem({required this.text});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(
              right: 6,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icon_check.png'),
              ),
            ),
          ),
          Text(
            text,
            style: blackTextStyle,
          ),
        ],
      ),
    );
  }
}
