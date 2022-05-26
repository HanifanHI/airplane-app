import 'package:airplane_apps/cubit/destination_cubit.dart';
import 'package:airplane_apps/cubit/seat_cubit.dart';
import 'package:airplane_apps/cubit/transaction_cubit.dart';
import 'package:airplane_apps/ui/pages/sign_in_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/auth_cubit.dart';
import 'cubit/page_cubit.dart';
import '/ui/pages/success_checkout_page.dart';
import '/ui/pages/bonus_pages.dart';
import '/ui/pages/main_page.dart';
import 'ui/pages/sign_up_page.dart';
import 'ui/pages/get_started_page.dart';
import 'ui/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => DestinationCubit(),
        ),
        BlocProvider(
          create: (context) => SeatCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
        routes: {
          SplashPage.routeNameSplahPage: (context) => SplashPage(),
          GetStartedPage.routeNameGetStartedPage: (context) => GetStartedPage(),
          SignUpPage.routeNameSignUpPage: (context) => SignUpPage(),
          BonusPage.routeNameBonusPage: (context) => BonusPage(),
          MainPage.routeNameMainPage: (context) => MainPage(),
          // DetailPage.routeNameDetailPage: (context) => DetailPage(),
          // ChooseSeatPage.routeNameChooseSeatPage: (context) => ChooseSeatPage(),
          // CheckoutPage.routeNameCheckoutPage: (context) => CheckoutPage(),
          SuccessCheckoutPage.routeNameSuccessCheckoutPage: (context) =>
              SuccessCheckoutPage(),
          SignInPage.routeNameSignInPage: (contex) => SignInPage(),
        },
      ),
    );
  }
}
