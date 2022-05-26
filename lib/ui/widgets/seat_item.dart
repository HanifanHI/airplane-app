import 'package:airplane_apps/cubit/seat_cubit.dart';
import 'package:flutter/material.dart';

import '/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatItem extends StatelessWidget {
  // * ATRIBUTE
  final bool isAvailable;
  final String id;

  // * CONSTRUCTOR
  SeatItem({
    this.isAvailable = true,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    // * PENGKONDISIAN
    // * 0: Available 1: Selected 2: Unavailable

    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    // * BACKGROUND
    backgroundColor() {
      // * PENGKONDISIAN
      if (!isAvailable) {
        return kUnavailableColor;
      } else {
        if (isSelected) {
          return kPrimaryColor;
        } else {
          return kAvailableColor;
        }
      }
    }

    // * BORDER
    border() {
      // * PENGKONDISIAN
      if (!isAvailable) {
        return kUnavailableColor;
      } else {
        return kPrimaryColor;
      }
    }

    // * CHILD
    child() {
      if (isSelected) {
        return Center(
          child: Text(
            'You',
            style: whiteTextStyle.copyWith(
              fontWeight: semiBold,
            ),
          ),
        );
      } else {
        return SizedBox();
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: backgroundColor(),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: border(),
            width: 2,
          ),
        ),
        child: child(),
      ),
    );
  }
}
