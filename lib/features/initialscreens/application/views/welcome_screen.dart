import 'package:efecto/core/assets.dart';
import 'package:efecto/core/theme.dart';
import 'package:efecto/features/initialscreens/application/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  static String routeName = "welcome-screen";
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryLightColor,
      body: Padding(
        padding: AppTheme.pagePadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: SvgPicture.asset(
                Assets.mainClockIcon,
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Text(
              "Manage Your Time \nEffectively",
              style: AppTheme.primaryBodyTextLarge.copyWith(fontSize: 28),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 35,
            ),
            Container(
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    "Signup To Continue",
                    style: AppTheme.primaryBodyTextLarge.copyWith(
                      color: AppTheme.whiteColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 21,
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
          ],
        ),
      ),
    );
  }
}
