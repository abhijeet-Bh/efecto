import 'package:efecto/core/assets.dart';
import 'package:efecto/core/task_model.dart';
import 'package:efecto/core/theme.dart';
import 'package:efecto/features/home/application/home_bloc.dart';
import 'package:efecto/features/timer/application/views/timer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/add_item_popup.dart';
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
    // TaskDataBox.clear();
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
                    // TaskData.taskList.add(TaskModel(
                    //   title: "New Task",
                    //   duration: 20,
                    //   priority: Priority.MEDIUM,
                    // ));
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AddItemPopup(
                          onAdd: (title, priority, duration, isComplete, date) {
                            // Add item to the list
                          },
                        );
                      },
                    ).then(
                      (value) => BlocProvider.of<HomeBloc>(context).add(
                        LoadTasksEvent(
                          DateTime.now(),
                        ),
                      ),
                    );
                  });
                },
              ),
              BlocConsumer<HomeBloc, HomeState>(
                listener: (BuildContext context, Object? state) {
                  if (state is HomeError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.redAccent,
                        content: Text(
                          "Something went wrong!",
                        ),
                      ),
                    );
                  }
                },
                builder: (BuildContext context, state) {
                  if (state is HomeInitial) {
                    BlocProvider.of<HomeBloc>(context)
                        .add(LoadTasksEvent(DateTime.now()));
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppTheme.primaryColor,
                        backgroundColor: AppTheme.primaryLightColor,
                        strokeCap: StrokeCap.round,
                      ),
                    );
                  } else if (state is HomeLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppTheme.primaryColor,
                        backgroundColor: AppTheme.primaryLightColor,
                        strokeCap: StrokeCap.round,
                      ),
                    );
                  } else if (state is HomeLoaded) {
                    return (state.tasks == null || state.tasks!.isEmpty)
                        ? const EmptyTodoWidget()
                        : Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (ctx, index) {
                                TaskModel task = state.tasks![index];
                                // debugPrint(task.isComplete.toString());
                                return Padding(
                                  padding: const EdgeInsets.only(top: 14.0),
                                  child: InkWell(
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
                                                          BorderRadius.circular(
                                                              20),
                                                      color: (task.isComplete)
                                                          ? AppTheme
                                                              .primaryColor
                                                          : AppTheme
                                                              .primaryLightColor,
                                                    ),
                                                    child: (task.isComplete)
                                                        ? Center(
                                                            child: SvgPicture
                                                                .asset(Assets
                                                                    .circleTickIcon),
                                                          )
                                                        : const SizedBox(),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        task.title,
                                                        style: AppTheme
                                                            .primaryHeadingTextMedium
                                                            .copyWith(
                                                          color: AppTheme
                                                              .secondaryLightColor,
                                                          decoration: (task
                                                                  .isComplete)
                                                              ? TextDecoration
                                                                  .lineThrough
                                                              : TextDecoration
                                                                  .none,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${task.duration.toString()} minutes',
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
                                            PriorityChip(
                                              priority: task.priority,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    onTap: () => Navigator.pushNamed(
                                      context,
                                      TimerScreen.routeName,
                                      arguments: {'task': task},
                                    ),
                                  ),
                                );
                              },
                              itemCount: state.tasks!.length,
                            ),
                          );
                  } else {
                    return const Center(
                      child: Text(
                        "Something went Wrong!",
                        style: AppTheme.primaryHeadingTextMedium,
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PriorityChip extends StatelessWidget {
  final int priority;
  const PriorityChip({
    super.key,
    required this.priority,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: (priority == 2)
            ? Colors.red
            : (priority == 1)
                ? Colors.orangeAccent
                : Colors.green,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 24.0),
        child: Text(
          (priority == 2)
              ? "High"
              : (priority == 1)
                  ? "Medium"
                  : "Low",
          style: AppTheme.primaryBodyTextSmall.copyWith(
            fontSize: 12,
            color: AppTheme.whiteColor,
          ),
        ),
      ),
    );
  }
}
