import 'package:efecto/features/home/application/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants.dart';
import '../../../../core/theme.dart';

class DateList extends StatefulWidget {
  const DateList({
    super.key,
  });

  @override
  State<DateList> createState() => _DateListState();
}

int selectedIndex = 2;

class _DateListState extends State<DateList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          child: DateChips(
            date: (DateTime.now().subtract(const Duration(days: 2))),
            isSelected: selectedIndex == 0,
          ),
          onTap: () {
            setState(() {
              selectedIndex = 0;
            });
            BlocProvider.of<HomeBloc>(context).add(LoadTasksEvent(
                DateTime.now().subtract(const Duration(days: 2))));
          },
        ),
        InkWell(
          child: DateChips(
            date: (DateTime.now().subtract(const Duration(days: 1))),
            isSelected: selectedIndex == 1,
          ),
          onTap: () {
            BlocProvider.of<HomeBloc>(context).add(LoadTasksEvent(
                DateTime.now().subtract(const Duration(days: 1))));
            setState(() {
              selectedIndex = 1;
            });
          },
        ),
        InkWell(
          child: DateChips(
            date: (DateTime.now()),
            isSelected: selectedIndex == 2,
          ),
          onTap: () {
            setState(() {
              selectedIndex = 2;
            });
            BlocProvider.of<HomeBloc>(context)
                .add(LoadTasksEvent(DateTime.now()));
          },
        ),
        InkWell(
          child: DateChips(
            date: (DateTime.now().add(const Duration(days: 1))),
            isSelected: selectedIndex == 3,
          ),
          onTap: () {
            setState(() {
              selectedIndex = 3;
            });
            BlocProvider.of<HomeBloc>(context).add(
                LoadTasksEvent(DateTime.now().add(const Duration(days: 1))));
          },
        ),
        InkWell(
          child: DateChips(
            date: (DateTime.now().add(const Duration(days: 2))),
            isSelected: selectedIndex == 4,
          ),
          onTap: () {
            setState(() {
              selectedIndex = 4;
            });
            BlocProvider.of<HomeBloc>(context).add(
                LoadTasksEvent(DateTime.now().add(const Duration(days: 2))));
          },
        ),
        InkWell(
          child: DateChips(
            date: (DateTime.now().add(const Duration(days: 3))),
            isSelected: selectedIndex == 5,
          ),
          onTap: () {
            setState(() {
              selectedIndex = 5;
            });
            BlocProvider.of<HomeBloc>(context).add(
                LoadTasksEvent(DateTime.now().add(const Duration(days: 3))));
          },
        ),
      ],
    );
  }
}

class DateChips extends StatelessWidget {
  final bool isSelected;
  final DateTime date;
  const DateChips({
    super.key,
    required this.date,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      width: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSelected ? AppTheme.primaryColor : AppTheme.whiteColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            (date.day > 9) ? date.day.toString() : '0${date.day}',
            style: AppTheme.primaryHeadingTextSmall.copyWith(
              color: isSelected ? AppTheme.whiteColor : AppTheme.primaryColor,
            ),
          ),
          Text(
            AppConstants.months[date.month],
            style: AppTheme.primaryHeadingTextSmall.copyWith(
              color: isSelected ? AppTheme.whiteColor : AppTheme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
