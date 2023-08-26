import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);

  double current=120.0;
  int age=20;
  double final_result=00.0;
  int weight=60;
  bool? isMale ;

  void changeGender(bool value){
    isMale=value;
    emit(ChangeGender());
  }
  void changeHeight(double value){
    current=value;
    emit(ChangeHeight());
  }
  void changeWeight(int value){
    weight=value;
    emit(ChangeWeight());
  }
  void changeAge(int value){
    age=value;
    emit(ChangeAge());
  }
}
