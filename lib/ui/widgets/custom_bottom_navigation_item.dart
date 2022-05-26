import 'package:airplane_apps/cubit/page_cubit.dart';
import 'package:flutter/material.dart';

import '/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomeBottomNavigationItem extends StatelessWidget {
  // * ATRIBUTE
  final int index;
  final String imageUrl;

  CustomeBottomNavigationItem({
    required this.index,
    required this.imageUrl,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Image.asset(
            imageUrl,
            width: 24,
            height: 24,
            color: context.read<PageCubit>().state == index
                ? kPrimaryColor
                : kGreyColor,
          ),
          Container(
            width: 30,
            height: 2,
            decoration: BoxDecoration(
              color: context.read<PageCubit>().state == index
                  ? kPrimaryColor
                  : kTransparentColor,
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
          )
        ],
      ),
    );
  }
}
