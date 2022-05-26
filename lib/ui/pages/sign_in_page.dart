import 'package:airplane_apps/cubit/auth_cubit.dart';
import 'package:airplane_apps/ui/pages/main_page.dart';
import 'package:airplane_apps/ui/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/ui/widgets/custom_button.dart';
import '/ui/widgets/custom_text_form_field.dart';
import '/shared/theme.dart';

class SignInPage extends StatelessWidget {
  // * ROUTE NAME
  static const routeNameSignInPage = '/sign-in-page';

  // * CONTROLLER
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    // * TITLE
    Widget title() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Text(
          'Sign In with your\nexisting account',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    // * INPUT SECTION
    Widget inputSection() {
      // * EMAIL
      Widget emailInput() {
        return CustomTextFormField(
          title: 'Email Address',
          hintText: 'Your Email Address',
          controller: emailController,
        );
      }

      // * PASSWORD
      Widget passwordInput() {
        return CustomTextFormField(
          title: 'Password',
          hintText: 'Your Password',
          isObscureText: true,
          controller: passwordController,
        );
      }

      // * SUBMIT BUTTON
      Widget submitButton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            // * KONDISI JIKA SUCCESS
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                MainPage.routeNameMainPage,
                (route) => false,
              );
              // * KONDISI JIKA ERROR
            } else if (state is AuthFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: kRedColor,
                ),
              );
            }
          },
          builder: (context, state) {
            // * KONDISI JIKA LOADING
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return CustomButton(
              title: 'Sign In',
              margin: EdgeInsets.only(
                top: 10,
              ),
              onPressed: () {
                context.read<AuthCubit>().signIn(
                      email: emailController.text,
                      password: passwordController.text,
                    );
              },
            );
          },
        );
      }

      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          children: [
            emailInput(),
            passwordInput(),
            submitButton(),
          ],
        ),
      );
    }

    // * SIGN UP BUTTON
    Widget signUpButton() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, SignUpPage.routeNameSignUpPage);
        },
        child: Container(
          margin: EdgeInsets.only(
            top: 50,
            bottom: 73,
          ),
          alignment: Alignment.center,
          child: Text(
            'Don\'t Have an account? Sign Up',
            style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          children: [
            title(),
            inputSection(),
            signUpButton(),
          ],
        ),
      ),
    );
  }
}
