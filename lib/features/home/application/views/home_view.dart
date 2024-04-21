import 'package:efecto/core/assets.dart';
import 'package:efecto/core/theme.dart';
import 'package:efecto/features/home/data/TaskData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/date_list_widget.dart';
import '../widgets/empty_todo_widget.dart';

class HomeView extends StatefulWidget {
  static String routeName = 'home-view';
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
        child: Padding(
          padding: AppTheme.pagePadding,
          child: Column(
            children: [
              const DateList(),
              const SizedBox(
                height: 18,
              ),
              InkWell(
                child: Container(
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
                onTap: () {
                  setState(() {
                    TaskData.taskList.add(TaskModel(
                      title: "New Task",
                      duration: 20,
                      priority: Priority.MEDIUM,
                    ));
                  });
                },
              ),
              (TaskData.taskList.isEmpty)
                  ? const EmptyTodoWidget()
                  : Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (ctx, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 14.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppTheme.whiteColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 22,
                                            width: 22,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: AppTheme.primaryLightColor,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                TaskData.taskList[index].title,
                                                style: AppTheme
                                                    .primaryHeadingTextMedium
                                                    .copyWith(
                                                        color: AppTheme
                                                            .secondaryLightColor),
                                              ),
                                              Text(
                                                '${TaskData.taskList[index].duration.toString()} minutes',
                                                style: AppTheme
                                                    .primaryBodyTextSmall
                                                    .copyWith(
                                                  fontSize: 12,
                                                  color: AppTheme
                                                      .secondaryLightColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.red,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4.0, horizontal: 24.0),
                                        child: Text(
                                          "High",
                                          style: AppTheme.primaryBodyTextSmall
                                              .copyWith(
                                            fontSize: 12,
                                            color: AppTheme.whiteColor,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: TaskData.taskList.length,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
