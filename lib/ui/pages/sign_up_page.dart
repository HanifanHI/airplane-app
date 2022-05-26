import 'package:airplane_apps/cubit/auth_cubit.dart';
import 'package:airplane_apps/ui/pages/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/ui/pages/bonus_pages.dart';
import '/ui/widgets/custom_button.dart';
import '/ui/widgets/custom_text_form_field.dart';
import '/shared/theme.dart';

class SignUpPage extends StatelessWidget {
  // * ROUTE NAME
  static const routeNameSignUpPage = '/sign-up-page';

  // * CONTROLLER
  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController hobbyController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    // * TITLE
    Widget title() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Text(
          'Join us and get\nyour next journey',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    // * INPUT SECTION
    Widget inputSection() {
      // * NAME
      Widget nameInput() {
        return CustomTextFormField(
          title: 'Full Name',
          hintText: 'Your full name',
          controller: nameController,
        );
      }

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

      // * HOBBY
      Widget hobbyInput() {
        return CustomTextFormField(
          title: 'Hobby',
          hintText: 'Your Hobby',
          controller: hobbyController,
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
                BonusPage.routeNameBonusPage,
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
              title: 'Get Started',
              margin: EdgeInsets.only(
                top: 10,
              ),
              onPressed: () {
                context.read<AuthCubit>().signUp(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      hobby: hobbyController.text,
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
            nameInput(),
            emailInput(),
            passwordInput(),
            hobbyInput(),
            submitButton(),
          ],
        ),
      );
    }

    // * SIGN IN BUTTON
    Widget signInButton() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, SignInPage.routeNameSignInPage);
        },
        child: Container(
          margin: EdgeInsets.only(
            top: 50,
            bottom: 73,
          ),
          alignment: Alignment.center,
          child: Text(
            'Have an account? Sign In',
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
            signInButton(),
          ],
        ),
      ),
    );
  }
}
