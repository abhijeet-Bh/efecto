import 'package:efecto/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddItemPopup extends StatefulWidget {
  final Function(String title, int priority, int duration, bool isComplete,
      DateTime date) onAdd;

  const AddItemPopup({super.key, required this.onAdd});

  @override
  State<AddItemPopup> createState() => _AddItemPopupState();
}

class _AddItemPopupState extends State<AddItemPopup> {
  final DateFormat formatter = DateFormat('dd-MM-yyyy');

  late String _title;
  late int _priority;
  late int _duration;
  late bool _isComplete;
  late DateTime _date;
  final List<String> _priorities = ["Low", "Medium", "High"];

  @override
  void initState() {
    super.initState();
    _title = '';
    _priority = 0;
    _duration = 25;
    _isComplete = false;
    _date = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: double.infinity,
        height: 385,
        decoration: BoxDecoration(
          color: AppTheme.primaryLightColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                style: AppTheme.primaryHeadingTextMedium,
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: AppTheme.primaryBodyTextLarge.copyWith(
                    color: AppTheme.secondaryLightColor,
                  ),
                ),
                onChanged: (value) => _title = value,
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<int>(
                value: _priority,
                onChanged: (value) => setState(() => _priority = value!),
                items: [0, 1, 2].map((priority) {
                  return DropdownMenuItem<int>(
                    value: priority,
                    child: Text(
                      _priorities[priority],
                      style: AppTheme.primaryHeadingTextMedium,
                    ),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Priority',
                  labelStyle: AppTheme.primaryBodyTextLarge.copyWith(
                    color: AppTheme.secondaryLightColor,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                style: AppTheme.primaryHeadingTextMedium,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Duration (minutes)',
                  labelStyle: AppTheme.primaryBodyTextLarge.copyWith(
                    color: AppTheme.secondaryLightColor,
                  ),
                ),
                onChanged: (value) => _duration = int.tryParse(value) ?? 0,
              ),
              // const SizedBox(height: 10),
              // DropdownButtonFormField<bool>(
              //   value: _isComplete,
              //   onChanged: (value) => setState(() => _isComplete = value!),
              //   items: [true, false].map((isComplete) {
              //     return DropdownMenuItem<bool>(
              //       value: isComplete,
              //       child: Text(isComplete ? 'Complete' : 'Incomplete'),
              //     );
              //   }).toList(),
              //   decoration: const InputDecoration(labelText: 'Status'),
              // ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date",
                        style: AppTheme.primaryBodyTextLarge.copyWith(
                          color: AppTheme.secondaryLightColor,
                        ),
                      ),
                      Text(
                        formatter.format(_date),
                        style: AppTheme.primaryHeadingTextMedium,
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit_calendar),
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: _date,
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2101),
                      );
                      if (picked != null) setState(() => _date = picked);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Add New Task",
                        style: AppTheme.primaryBodyTextMedium
                            .copyWith(color: AppTheme.whiteColor),
                      ),
                    ),
                  ),
                ),
                onTap: () => Navigator.pop(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
