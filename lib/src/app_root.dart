import 'package:bmi_calc/bloc/app_cubit.dart';
import 'package:bmi_calc/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit(),
        ),
      ],
      child: MaterialApp(home: HomeView(),),
    );
  }
}
