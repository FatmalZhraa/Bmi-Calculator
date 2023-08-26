import 'package:bmi_calc/bloc/app_cubit.dart';
import 'package:bmi_calc/screens/result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override

  double current=120.0;
  int age=20;
  double final_result=00.0;
  int weight=60;
  bool isMale =true ;

  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit = AppCubit.get(context);

    return Scaffold(
      backgroundColor:Color(0xff1f1b23),
      appBar: AppBar(title: Text("BMI CALCULATOR"),backgroundColor:Color(0xff1f1b23) ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment:  MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                     cubit.changeGender(true);
                    },
                    child: Container(
                      width: 160,
                      height: 150,

                      decoration: BoxDecoration(
                          borderRadius:  BorderRadius.circular(20),
                        color: isMale ? Colors.pinkAccent : Color(0xff1f1b31),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.male,color: Colors.white,size: 70,),
                          Text('MALE',style: TextStyle(color: Colors.white,fontSize: 23),)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      cubit.changeGender(false);
                    },
                    child: Container(
                      width: 160,
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius:  BorderRadius.circular(20),
                        color: isMale ?  Color(0xff1f1b31) :Colors.pinkAccent ,
                      ),

                      child: Column(
                        mainAxisAlignment:  MainAxisAlignment.center,
                        children: [
                          Icon(Icons.female,color: Colors.white,size: 70,),
                          Text('FEMALE',style: TextStyle(color: Colors.white,fontSize: 23),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff1f1b31),
                  borderRadius:  BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("HEIGHT",style: TextStyle(color: Colors.white,fontSize: 20)),
                    SizedBox(height: 10,),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(current.toInt().toString(),
                              style: TextStyle(color: Colors.white,fontSize: 40)),
                           SizedBox(
                            width: 15.0,
                          ),
                           Text(
                            'cm' ,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0 ,
                            ),
                           ),
                        ],
                      ),

                    SizedBox(height: 10,),
                    Slider(
                        min: 50,
                        max: 250,
                        value: current,
                        activeColor: Colors.pinkAccent
                        ,onChanged: (double value){
                      cubit.changeHeight(current);
                    }),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 160,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius:  BorderRadius.circular(20),
                        color:Color(0xff1f1b31)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT',style: TextStyle( color: Colors.white,fontSize: 30),),
                        Text(weight.toString(),
                          style: TextStyle( color: Colors.white,fontSize: 30),),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                                backgroundColor: Colors.pinkAccent,
                                child: Icon(CupertinoIcons.minus),
                                onPressed: (){
                                 cubit.changeWeight(weight);
                                }),
                            SizedBox(width: 10,),
                            FloatingActionButton(
                                backgroundColor: Colors.pinkAccent,
                                child: Icon(CupertinoIcons.add),
                                onPressed: (){
                                  cubit.changeWeight(weight);
                                })
                          ],
                        )
                      ],
                    ),

                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 160,
                    height: 150,

                    decoration: BoxDecoration(
                        borderRadius:  BorderRadius.circular(20),
                        color:Color(0xff1f1b31)

                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE',style: TextStyle( color: Colors.white,fontSize: 30),),
                        SizedBox(height: 5,),
                        Text(age.toString(),style: TextStyle( color: Colors.white,fontSize: 30),),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                                backgroundColor: Colors.pinkAccent,
                                child: Icon(CupertinoIcons.minus),
                                onPressed: (){
                                  cubit.changeAge(age);
                                }),
                            SizedBox(width: 10,),
                            FloatingActionButton(
                                backgroundColor: Colors.pinkAccent,
                                child: Icon(CupertinoIcons.add),
                                onPressed: (){
                                  cubit.changeAge(age);
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: Colors.pinkAccent
                ),
                width: double.infinity,
                height: 50.0 ,
                child: MaterialButton(onPressed: ()
                {
                  double result = weight /(current/100*current/100);
                  print(result.toStringAsFixed(2)) ;
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Bmi_Result(result:result, ismale: isMale, Age: age,)),
                  );
                },
                  child: const Text(
                    'Bmi Calculator' ,
                    style: TextStyle(
                      fontSize: 20.0 ,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
     /* bottomSheet: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.pinkAccent,
        ),
        child: Center(child: Text("CALCULATE", style: TextStyle(color: Colors.white),)),

      ),*/
    );
  },
);

  }
  void CalcBmi()
  {
    double result = weight* (current*current);
    String bmi =result.toStringAsFixed(2);
    setState(() {
      result=bmi as double;
    });
  }
}
