import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groovy/common/helpers/is_dark_mode.dart';
import 'package:groovy/common/widgets/appbar/app_bar.dart';
import 'package:groovy/common/widgets/button/basic_button.dart';
import 'package:groovy/core/configs/assets/app_images.dart';
import 'package:groovy/core/configs/assets/app_vectors.dart';
import 'package:groovy/core/configs/theme/app_colors.dart';
import 'package:groovy/presentation/auth/pages/signin_page.dart';
import 'package:groovy/presentation/auth/pages/signup_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              AppVectors.topPattern,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(
              AppVectors.bottomPattern,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              AppImages.authBG,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 100,
                horizontal: 30,
              ),
              child: Column(
                children: [
                  SvgPicture.asset(AppVectors.logo),
                  const SizedBox(height: 20),
                  const Text(
                    "Enjoy listening to music",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Spotify is a proprietary Swedish audio streaming and media services provider",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: BasicButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => SignUpPage(),
                              ),
                            );
                          },
                          title: "Register",
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const SignInPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                              color: context.isDarkMode
                                  ? AppColors.lightBackground
                                  : AppColors.darkBackground,
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
