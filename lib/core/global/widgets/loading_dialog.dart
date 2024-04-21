import 'package:flutter/material.dart';

import '../../theme.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Center(
        child: Container(
          width: 200.0,
          height: 200.0,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: AppTheme.primaryLightColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Center(
            child: CircularProgressIndicator(
              color: AppTheme.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
