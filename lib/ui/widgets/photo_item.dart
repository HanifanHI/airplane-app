import 'package:flutter/material.dart';

import '/shared/theme.dart';

class PhotoItem extends StatelessWidget {
  // * ATRIBUTE
  final String imageUrl;
  // * CONSTRUCTOR
  PhotoItem({required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultMargin),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
