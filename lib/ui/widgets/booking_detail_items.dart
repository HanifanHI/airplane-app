import 'package:flutter/material.dart';

import '/shared/theme.dart';

class BookingDetailItems extends StatelessWidget {
  // * ATRIBUTE
  final String title;
  final String valueText;
  final Color valueColor;

  // * CONSTRUCTOR
  BookingDetailItems({
    required this.title,
    required this.valueText,
    required this.valueColor,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(right: 6),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icon_check.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            title,
            style: blackTextStyle,
          ),
          Spacer(),
          Text(
            valueText,
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}
