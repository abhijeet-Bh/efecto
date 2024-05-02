part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
}

final class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

final class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

final class HomeLoaded extends HomeState {
  final List<TaskModel>? tasks;

  const HomeLoaded(this.tasks);
  @override
  List<Object> get props => [];
}

final class HomeError extends HomeState {
  @override
  List<Object> get props => [];
}
