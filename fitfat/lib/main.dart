// ignore_for_file: unused_import, prefer_const_constructors
import 'dart:ui';
import 'package:fitfat/screens/AddTrainers.dart';
import 'package:fitfat/screens/AddWeight.dart';
import 'package:fitfat/screens/Delete/add_student_page.dart';
import 'package:fitfat/screens/Delete/home_page.dart';
import 'package:fitfat/screens/Delete/list_student_page.dart';
import 'package:fitfat/screens/Diet.dart';
import 'package:fitfat/screens/NewPedometer.dart';
import 'package:fitfat/screens/Pushups.dart';
import 'package:fitfat/screens/Trainer.dart';
import 'package:fitfat/screens/TrainerData.dart';
import 'package:fitfat/screens/Trainers.dart';
import 'package:fitfat/screens/Workout_Demo.dart';
import 'package:fitfat/screens/YogaVideos/childpose.dart';
import 'package:fitfat/screens/dahboard.dart';
import 'package:fitfat/screens/dashboard_screen.dart';
import 'package:fitfat/screens/diet_plan.dart';
import 'package:fitfat/screens/dietplan.dart';
import 'package:fitfat/screens/dummy.dart';
import 'package:fitfat/screens/footCounter.dart';
import 'package:fitfat/screens/home_screen.dart';
import 'package:fitfat/screens/mainlogin.dart';
import 'package:fitfat/screens/pedometer.dart';
import 'package:fitfat/screens/radial_progress.dart';
import 'package:fitfat/screens/splash_screen.dart';
import 'package:fitfat/screens/takeweight.dart';
import 'package:fitfat/screens/userrecord.dart';
import 'package:fitfat/screens/welcome_screen.dart';
import 'package:fitfat/screens/yoga.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pedometer/pedometer.dart';
import 'package:provider/provider.dart';
import 'package:workmanager/workmanager.dart';
import 'models/Auth.dart';
import 'models/FirebaseUser.dart';
import 'notifications.dart';
import 'screens/childpose.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.black,
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.black,
            textTheme: ButtonTextTheme.primary,
            colorScheme:
                Theme.of(context).colorScheme.copyWith(secondary: Colors.white),
          ),
          fontFamily: 'Georgia',
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ),
        
        home: Home(),
        //home: Home(),
        //home: HomePage(), 
        //home: TakeWeight(),
        //home: YOGA(),
        //home: Workout(),
        //home: SplashScreen(),
        //home: Home(),
        //home: PedometerFunction(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
