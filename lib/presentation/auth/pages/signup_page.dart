import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groovy/common/helpers/is_dark_mode.dart';
import 'package:groovy/common/widgets/appbar/app_bar.dart';
import 'package:groovy/common/widgets/button/basic_button.dart';
import 'package:groovy/core/configs/assets/app_vectors.dart';
import 'package:groovy/core/configs/theme/app_colors.dart';
import 'package:groovy/presentation/auth/pages/signin_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: SvgPicture.asset(
            AppVectors.logo,
            height: 40,
            width: 40,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 70,
          horizontal: 30,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _registerText(),
              const SizedBox(height: 15),
              _helpText(),
              const SizedBox(height: 30),
              _fullNameField(context),
              const SizedBox(height: 30),
              _emailField(context),
              const SizedBox(height: 30),
              _passwordField(context),
              const SizedBox(height: 30),
              BasicButton(
                onPressed: () {},
                title: "Create Account",
              ),
              const SizedBox(height: 40),
              _singinText(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      "Register",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    );
  }

  Widget _helpText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "If You Need Any Support ",
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            "Click Here",
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  Widget _fullNameField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(hintText: "Full Name")
          .applyDefaults(Theme.of(context).inputDecorationTheme),
      cursorColor: context.isDarkMode
          ? AppColors.lightBackground
          : AppColors.darkBackground,
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(hintText: "Enter Email")
          .applyDefaults(Theme.of(context).inputDecorationTheme),
      cursorColor: context.isDarkMode
          ? AppColors.lightBackground
          : AppColors.darkBackground,
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(hintText: "Password")
          .applyDefaults(Theme.of(context).inputDecorationTheme),
      cursorColor: context.isDarkMode
          ? AppColors.lightBackground
          : AppColors.darkBackground,
    );
  }

  Widget _singinText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Do You Have An Account? ",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const SignInPage(),
              ),
            );
          },
          child: Text(
            "Sign In",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        )
      ],
    );
  }
}
