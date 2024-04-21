import 'package:flutter/material.dart';

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
            date: (DateTime.now().day - 2).toString(),
            month: AppConstants.months[DateTime.now().month],
            isSelected: selectedIndex == 0,
          ),
          onTap: () {
            setState(() {
              selectedIndex = 0;
            });
          },
        ),
        InkWell(
          child: DateChips(
            date: (DateTime.now().day - 1).toString(),
            month: AppConstants.months[DateTime.now().month],
            isSelected: selectedIndex == 1,
          ),
          onTap: () {
            setState(() {
              selectedIndex = 1;
            });
          },
        ),
        InkWell(
          child: DateChips(
            date: (DateTime.now().day - 0).toString(),
            month: AppConstants.months[DateTime.now().month],
            isSelected: selectedIndex == 2,
          ),
          onTap: () {
            setState(() {
              selectedIndex = 2;
            });
          },
        ),
        InkWell(
          child: DateChips(
            date: (DateTime.now().day + 1).toString(),
            month: AppConstants.months[DateTime.now().month],
            isSelected: selectedIndex == 3,
          ),
          onTap: () {
            setState(() {
              selectedIndex = 3;
            });
          },
        ),
        InkWell(
          child: DateChips(
            date: (DateTime.now().day + 2).toString(),
            month: AppConstants.months[DateTime.now().month],
            isSelected: selectedIndex == 4,
          ),
          onTap: () {
            setState(() {
              selectedIndex = 4;
            });
          },
        ),
        InkWell(
          child: DateChips(
            date: (DateTime.now().day + 3).toString(),
            month: AppConstants.months[DateTime.now().month],
            isSelected: selectedIndex == 5,
          ),
          onTap: () {
            setState(() {
              selectedIndex = 5;
            });
          },
        ),
      ],
    );
  }
}

class DateChips extends StatelessWidget {
  final bool isSelected;
  final String date;
  final String month;
  const DateChips({
    super.key,
    required this.date,
    required this.month,
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
            date,
            style: AppTheme.primaryHeadingTextSmall.copyWith(
              color: isSelected ? AppTheme.whiteColor : AppTheme.primaryColor,
            ),
          ),
          Text(
            month,
            style: AppTheme.primaryHeadingTextSmall.copyWith(
              color: isSelected ? AppTheme.whiteColor : AppTheme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
