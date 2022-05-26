import 'package:airplane_apps/cubit/page_cubit.dart';
import 'package:airplane_apps/ui/pages/settings_page.dart';
import 'package:airplane_apps/ui/pages/transaction_page.dart';
import 'package:airplane_apps/ui/pages/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '/ui/pages/settings_page.dart';
// import '/ui/pages/transaction_page.dart';
// import '/ui/pages/wallet_page.dart';

import '/shared/theme.dart';
import '/ui/pages/home_page.dart';
import '/ui/widgets/custom_bottom_navigation_item.dart';

class MainPage extends StatelessWidget {
  // * ROUTE NAME
  static const routeNameMainPage = '/main-page';
  @override
  Widget build(BuildContext context) {
    // * CONTENT
    Widget buildContent(int currentIndex) {
      // * PENGKONDISIAN
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return TransactionPage();
        case 2:
          return WalletPage();
        case 3:
          return SettingsPage();
        default:
          return HomePage();
      }
    }

    // * BUTTON NAVIGATION
    Widget costumeButtonNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(
            right: defaultMargin,
            left: defaultMargin,
            bottom: 30,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultRadius),
            color: kWhiteColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomeBottomNavigationItem(
                index: 0,
                imageUrl: 'assets/icon_home.png',
              ),
              CustomeBottomNavigationItem(
                index: 1,
                imageUrl: 'assets/icon_booking.png',
              ),
              CustomeBottomNavigationItem(
                index: 2,
                imageUrl: 'assets/icon_card.png',
              ),
              CustomeBottomNavigationItem(
                index: 3,
                imageUrl: 'assets/icon_settings.png',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: kBackgroundColor,
          body: Stack(
            children: [
              buildContent(currentIndex),
              costumeButtonNavigation(),
            ],
          ),
        );
      },
    );
  }
}
