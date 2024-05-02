import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/task_data_box.dart';
import '../../../core/task_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadTasksEvent>((event, emit) async {
      debugPrint(event.selectedDate.toString());
      emit(HomeLoading());
      try {
        List<TaskModel>? tasks =
            await TaskDataBox.ageAllTasks(event.selectedDate);
        return emit(HomeLoaded(tasks));
      } catch (e) {
        return emit(HomeError());
      }
    });

    on<AddTasksEvent>((event, emit) async {
      if (event.task.date.day == DateTime.now().day &&
          event.task.date.month == DateTime.now().month) {
        emit(HomeLoading());
        await TaskDataBox.storeNewTask(event.task);
        List<TaskModel>? tasks = await TaskDataBox.ageAllTasks(DateTime.now());
        emit(HomeLoaded(tasks));
      } else {
        await TaskDataBox.storeNewTask(event.task);
      }
    });
  }
}
