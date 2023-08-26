part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}
class ChangeGender extends AppState {}
class ChangeHeight extends AppState {}
class ChangeWeight extends AppState {}
class ChangeAge extends AppState {}
