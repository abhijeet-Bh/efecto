import 'package:efecto/core/assets.dart';
import 'package:efecto/core/theme.dart';
import 'package:efecto/features/home/application/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends StatelessWidget {
  static String routeName = "login-screen";
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryLightColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: AppTheme.pagePadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Welcome Back!",
                    style: AppTheme.primaryHeadingTextLarge,
                  ),
                  Text(
                    "Login to your account to continue",
                    style: AppTheme.primaryBodyTextMedium.copyWith(
                      color: AppTheme.secondaryLightColor,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  const LoginSignupInputField(
                    icon: Assets.emailIcon,
                    hintText: "email@example.com",
                    isSecure: false,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const LoginSignupInputField(
                    icon: Assets.lockIcon,
                    hintText: "password",
                    isSecure: true,
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Text(
                            "Login",
                            style: AppTheme.primaryBodyTextLarge.copyWith(
                              color: AppTheme.whiteColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () => Navigator.pushNamed(
                      context,
                      HomeView.routeName,
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have account? ',
                        style: AppTheme.primaryBodyTextLarge.copyWith(
                          color: AppTheme.secondaryLightColor,
                        ),
                      ),
                      InkWell(
                        child: Text(
                          ' Login',
                          style: AppTheme.primaryBodyTextLarge.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onTap: () => Navigator.pushNamed(
                          context,
                          LoginView.routeName,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppTheme.primaryColor,
                          indent: 60,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.0),
                        child: Text(
                          "Or",
                          style: AppTheme.primaryHeadingTextLarge,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: AppTheme.primaryColor,
                          endIndent: 60,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const Text(
                    "Continue using your socials",
                    style: AppTheme.primaryBodyTextMedium,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            Assets.googleIcon,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            Assets.appleIcon,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginSignupInputField extends StatelessWidget {
  final String icon;
  final String hintText;
  final bool isSecure;
  const LoginSignupInputField({
    super.key,
    required this.icon,
    required this.hintText,
    required this.isSecure,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 55,
          width: 50,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            color: AppTheme.primaryColor,
          ),
          child: Center(
            child: SvgPicture.asset(
              icon,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 55,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: AppTheme.whiteColor,
            ),
            child: TextField(
              obscureText: isSecure,
              style: AppTheme.primaryHeadingTextMedium,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: AppTheme.primaryHeadingTextMedium.copyWith(
                  color: AppTheme.primaryLightColor,
                ),
                isDense: true,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
