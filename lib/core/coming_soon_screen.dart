import 'package:efecto/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'assets.dart';

class ComingSoonScreen extends StatelessWidget {
  static String routeName = "coming_soon";

  const ComingSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.workInProgressIcon,
              height: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "This Page is under Construction..!",
              style: AppTheme.primaryHeadingTextMedium,
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Will be Online Soon.",
              style: AppTheme.primaryBodyTextMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Go Back"),
            )
          ],
        ),
      ),
    );
  }
}
