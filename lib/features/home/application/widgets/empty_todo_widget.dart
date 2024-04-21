import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/assets.dart';
import '../../../../core/theme.dart';

class EmptyTodoWidget extends StatelessWidget {
  const EmptyTodoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 50,
        ),
        SvgPicture.asset(
          Assets.homeEmptyIcon,
        ),
        Text(
          "Beat Your Procrastination, \nCreate New Task Now!",
          style: AppTheme.primaryBodyTextLarge.copyWith(
            color: AppTheme.secondaryLightColor,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 28,
        ),
        Text(
          "“You may delay, but time will not.”\n-Benjamin Franklin",
          style: AppTheme.primaryBodyTextLarge.copyWith(
            color: AppTheme.secondaryLightColor,
            letterSpacing: 1,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
