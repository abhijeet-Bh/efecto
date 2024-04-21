import 'package:efecto/core/assets.dart';
import 'package:efecto/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/date_list_widget.dart';
import '../widgets/empty_todo_widget.dart';

class HomeView extends StatelessWidget {
  static String routeName = 'home-view';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryLightColor,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryLightColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 14.0),
          child: Center(
            child: SvgPicture.asset(
              Assets.menuIcon,
            ),
          ),
        ),
        title: const Text(
          "Efacto",
          style: AppTheme.primaryHeadingTextLarge,
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppTheme.pagePadding,
            child: Column(
              children: [
                const DateList(),
                const SizedBox(
                  height: 18,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppTheme.secondaryLightColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppTheme.whiteColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              color: AppTheme.primaryColor,
                              size: 18,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Create New Task",
                          style: AppTheme.primaryBodyTextMedium
                              .copyWith(color: AppTheme.whiteColor),
                        )
                      ],
                    ),
                  ),
                ),
                const EmptyTodoWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
