import 'dart:async';
import 'package:airplane_apps/cubit/auth_cubit.dart';
import 'package:airplane_apps/ui/pages/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/ui/pages/get_started_page.dart';
import '/shared/theme.dart';

class SplashPage extends StatefulWidget {
  // * ROUTE NAME
  static const routeNameSplahPage = '/splash-page';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      // * MEMBUAT OBJEK USER SAAT INI
      User? user = FirebaseAuth.instance.currentUser;

      // * KONDISI JIKA USER BELUM REGISTER
      if (user == null) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          GetStartedPage.routeNameGetStartedPage,
          (route) => false,
        );
      } else {
        // * KONDISI JIKA USER SUDAH REGISTER
        context.read<AuthCubit>().getCurrentUser(user.uid);
        Navigator.pushNamedAndRemoveUntil(
          context,
          MainPage.routeNameMainPage,
          (route) => false,
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  bottom: 50,
                ),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/icon_plane.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                'AIRPLANE',
                style: whiteTextStyle.copyWith(
                  fontSize: 32,
                  fontWeight: medium,
                  letterSpacing: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
