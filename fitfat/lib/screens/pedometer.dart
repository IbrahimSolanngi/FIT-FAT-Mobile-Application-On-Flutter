// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitfat/main.dart';
import 'package:fitfat/models/auth.dart';
import 'package:fitfat/screens/childpose.dart';
import 'package:fitfat/screens/home_screen.dart';
import 'package:fitfat/screens/radial_progress.dart';
import 'package:fitfat/screens/widget/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class PedometerFunction extends StatefulWidget {
  PedometerFunction();

  @override
  State<PedometerFunction> createState() => _PedometerFunctionState();
}

class _PedometerFunctionState extends State<PedometerFunction> {
  final AuthService _auth = new AuthService();
  //final service = FlutterBackgroundService();
  //final email = FirebaseAuth.instance.currentUser!.email!;
  //final StepCollection = FirebaseFirestore.instance.collection('StepCounter');

  DateTime currentDateTime = DateTime.now();
  GoogleMapController? _mapController = null;
  final LatLng _center = const LatLng(37.7749, -122.4194);
  late LocationData currentLocation;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  
  double _distanceCovered = 0.0;
  double _previousX = 0.0;
  double _previousY = 0.0;
  double _previousZ = 0.0;

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen(_onAccelerometerEvent);
    _getLocation();
  }

  void _onAccelerometerEvent(AccelerometerEvent event) {
    final currentX = event.x;
    final currentY = event.y;
    final currentZ = event.z;

    final distanceX = currentX - _previousX;
    final distanceY = currentY - _previousY;
    final distanceZ = currentZ - _previousZ;

    _distanceCovered += sqrt(distanceX * distanceX +
        distanceY * distanceY +
        distanceZ * distanceZ);

    setState(() {
      // Update the state to display the distance covered
    });

    _previousX = currentX;
    _previousY = currentY;
    _previousZ = currentZ;
  }


  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  Future refresh() async {}

  void sendDataToFirebase() async {
    FirebaseFirestore.instance
        .collection('data')
        .add({'timestamp': FieldValue.serverTimestamp()});
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _getLocation();
  // }

  void _getLocation() async {
    var location = Location();
    try {
      currentLocation = await location.getLocation();
      _mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target:
                LatLng(currentLocation.latitude!, currentLocation.longitude!),
            zoom: 14.0,
          ),
        ),
      );
    } catch (e) {
      print('Could not get location: $e');
    }
  }

  double x = 0.0;
  double y = 0.0;
  double z = 0.0;
  int noofsteps = 0;
  double c = 1312.33595801;
  double kilos = 0;
  double exactDistance = 0.0;
  double previousDistance = 0.0;

  getCurrentDate() {
    var date = DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    // Initializing the settings for the plugin
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    );

    // Initializing the plugin with the settings
    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    final Header = Material(
      child: Column(
        children: [
          Container(
            height: 35,
            //color: Colors.red,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              // ignore: prefer_const_literals_to_create_immutables
              gradient: LinearGradient(colors: [
                // Color.fromARGB(255, 248, 119, 162),
                // Color.fromARGB(255, 241, 175, 131),
                Color.fromARGB(255, 241, 104, 150),
                Color.fromARGB(255, 253, 160, 98),
              ]),
            ),
            child: Row(
              children: [
                Container(
                    child: InkWell(
                  child:
                      Icon(Icons.arrow_back_ios_new_sharp, color: Colors.white),
                  onTap: () {
                    //action code when clicked
                    print("The icon is clicked");
                  },
                )),
                SizedBox(width: 85),
                Container(
                  width: 135,
                  // child: Text(
                  //   '$currentDateTime',
                  //   textAlign: TextAlign.center,
                  //   style: GoogleFonts.lato(
                  //     textStyle: Theme.of(context).textTheme.headline4,
                  //     fontSize: 20,
                  //     fontWeight: FontWeight.w900,
                  //     color: Colors.white,
                  //     letterSpacing: 1,
                  //   ),
                  // ),
                ),
                IconButton(
                  padding: const EdgeInsets.only(left: 69.0, right: 0.0),
                  icon: Icon(
                    Icons.history_sharp,
                    color: Colors.white,
                    size: 33,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );

    final PosterArea = Material(
      child: Container(
        height: 250,
        width: 400,
        alignment: Alignment.center,
        //color: Colors.black,

        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20.0, left: 10.0),
              decoration: BoxDecoration(
                // ignore: prefer_const_literals_to_create_immutables
                borderRadius: BorderRadius.circular(10),
                //color: Color.fromARGB(255, 92, 155, 164),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 5.0,
                    spreadRadius: 1.1,
                  ),
                ],
              ),
              padding: const EdgeInsets.only(right: 10.0, left: 10.0),
              height: 250,
              width: 339,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
                myLocationEnabled: true,
              ),

              // child: Image.asset(
              //   'assets/images/giphy.gif',
              // ),
            ),
          ],
        ),
      ),
    );
    final PedometerShape = Material(
      child: StreamBuilder<AccelerometerEvent>(
        stream: SensorsPlatform.instance.accelerometerEvents,
        builder: (context, snapshort) {
          if (snapshort.hasData) {
            x = snapshort.data!.x;
            y = snapshort.data!.y;
            z = snapshort.data!.z;
            exactDistance = calculateMagnitude(x, y, z);
            if (exactDistance > 6) {
              noofsteps++;
              // Defining the notification details
              const AndroidNotificationDetails androidNotificationDetails =
                  AndroidNotificationDetails(
                'channel_id',
                'channel_name', importance: Importance.low,
                sound:
                    null, // or set it to `RawResourceAndroidNotificationSound('your_custom_sound')` to use a custom sound file
              );

              const NotificationDetails notificationDetails =
                  NotificationDetails(android: androidNotificationDetails);

              // Scheduling the notification to be shown after 5 seconds
              flutterLocalNotificationsPlugin.schedule(
                0,
                'Steps Count: ' + noofsteps.toString(),
                'KM Count: ' + kilos.toStringAsFixed(2),
                DateTime.now().add(const Duration(seconds: 5)),
                notificationDetails,
              );
            }
            ;
            child:
            const Text('Show Notification');
            Save();
          }
          return Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyan,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Steps',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    noofsteps.toString(),
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );

    final PedomterArea = Material(
      child: StreamBuilder<AccelerometerEvent>(
        stream: SensorsPlatform.instance.accelerometerEvents,
        builder: (context, snapshort) {
          if (snapshort.hasData) {
            x = snapshort.data!.x;
            y = snapshort.data!.y;
            z = snapshort.data!.z;
            exactDistance = calculateMagnitude(x, y, z);
            if (exactDistance > 6) {
              // try {
              //   final StepCollection=FirebaseFirestore.instance.collection('StepCounter');
              //   final docref=StepCollection.doc(CYXoe3htdpMKWfmPpz5w);

              //   docref.update({"Steps":noofsteps});
              // } catch (e) {
              noofsteps++;
              Save();
              // var result2 = FirebaseFirestore.instance
              //     .collection('Pedometer')
              //     .where('Email',
              //         isEqualTo: FirebaseAuth.instance.currentUser!.email!)
              //     .get();

              //  Map<String, String> dataToSave = {
              //       'Email': FirebaseAuth.instance.currentUser!.email!,
              //       'Steps': noofsteps.toString(),
              //       'Date': "${getCurrentDate()}"
              //     };
              //     FirebaseFirestore.instance.collection('Pedometer').add(dataToSave);
              //     print('Save Data');

              //}
            }
          }
          return Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: Text(
                    noofsteps.toString() + " Steps ",
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

    final SetProgressBar = Material(
        // child: CircularProgressIndicator(
        //   backgroundColor: Colors.pinkAccent,
        //   valueColor: AlwaysStoppedAnimation(Colors.black),
        //   strokeWidth: 10,
        // ),
        );

    final CaloriesCounter = Material();

    final KilometerCounter = Material();

    final Goals = Material(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              kilos.toStringAsFixed(2) + " KM",
              style: TextStyle(fontSize: 24),
            ),
          ),
        //   Container(
        //     child: ElevatedButton(
        //       onPressed: () {
        //         // Defining the notification details
        //         const AndroidNotificationDetails androidNotificationDetails =
        //             AndroidNotificationDetails(
        //           'channel_id',
        //           'channel_name',
        //           importance: Importance.max,
        //         );

        //         const NotificationDetails notificationDetails =
        //             NotificationDetails(android: androidNotificationDetails);

        //         // Scheduling the notification to be shown after 5 seconds
        //         flutterLocalNotificationsPlugin.schedule(
        //           0,
        //           'Steps Count: ' + noofsteps.toString(),
        //           'This is a notification example',
        //           DateTime.now().add(const Duration(seconds: 5)),
        //           notificationDetails,
        //         );
        //       },
        //       child: const Text('Show Notification'),
        //     ),
        //   ),
        ],
      ),

      //     child: Container(
      //   alignment: Alignment.center,
      //   child: Text(
      //     kilos.toString() + "\nKilometers",
      //     style: TextStyle(
      //         color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
      //   ),
      // )
    );

    final SetGoals = Material();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 0.0, right: 28.0),
            //padding: const EdgeInsets.only(left: 20.0, right: 0.0),
            alignment: Alignment.center,
            child: InkWell(
                child: Container(
                  child: ProfilePicture(
                    name: FirebaseAuth.instance.currentUser!.email!,
                    radius: 16,
                    fontsize: 15,
                    random: false,
                    count: 2,
                    tooltip: true,
                    //role: 'ADMINISTRATOR',
                    img: (FirebaseAuth.instance.currentUser?.photoURL),
                    //img: 'https://avatars.githubusercontent.com/u/37553901?v=4',
                  ),
                ),
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => WelcomeScreen()));
                }),
          ),
          Container(
            margin: const EdgeInsets.only(left: 25.0, right: 0.0),
            //padding: const EdgeInsets.only(left: 20.0, right: 0.0),
            alignment: Alignment.center,
            child: Text(
              'PEDOMETER',
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
              )),
            ),
          ),
          GestureDetector(
            // When the child is tapped, show a snackbar
            onTap: () {
              print('MK');
            },
            child: Container(
              margin: const EdgeInsets.only(left: 38.0, right: 6.0),
              //padding: const EdgeInsets.only(left: 20.0, right: 0.0),
              alignment: Alignment.center,
              child: Text(
                'GET PRO',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w900,
                  textStyle: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    background: Paint()
                      ..color = Colors.lightBlue.shade300
                      ..strokeWidth = 14
                      ..strokeJoin = StrokeJoin.round
                      //..strokeCap = StrokeCap.round
                      ..style = PaintingStyle.stroke,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 0.0, right: 5.0),
            child: IconButton(
                icon: Icon(
                  Icons.notifications_none,
                  color: Colors.black54,
                  size: 33,
                ),
                onPressed: () {}),
          ),
        ],
        backgroundColor: Colors.white,
        //centerTitle: true,
      ),
      bottomNavigationBar: GNav(
        gap: 8,
        iconSize: 30,
        color: Colors.grey[800],
        backgroundColor: Colors.white,
        rippleColor: Colors.grey,
        activeColor: Colors.pinkAccent,
        haptic: true, // haptic feedback
        hoverColor: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.bubble_chart,
            text: 'Workout',
          ),
          GButton(
            icon: Icons.food_bank,
            text: 'Meal',
          ),
          GButton(
            icon: Icons.supervised_user_circle_rounded,
            text: 'Trainers',
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                //child:(
                //padding: const EdgeInsets.all(16.0),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Header,
                    PosterArea,
                    SizedBox(height: 18),
                    PedometerShape,
                    SizedBox(height: 18),
                    //PedomterArea,
                    SetProgressBar,
                    CaloriesCounter,
                    KilometerCounter,
                    Goals,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double calculateMagnitude(double x, double y, double z) {
    double distance = sqrt(x * x + y * y + z * z);
    getPreviousValue();
    double mode = distance - previousDistance;
    setprefData(distance);
    return mode;
  }

  void setprefData(double predistance) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setDouble("previousDistance", predistance);
  }

  void getPreviousValue() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setState(() {
      previousDistance = _pref.getDouble("previousDistance") ?? 0;
    });
  }

  Future<void> Save() async {
    kilos = noofsteps / c;
    var docname =
        FirebaseAuth.instance.currentUser!.email! + getCurrentDate().toString();
    CollectionReference users =
        FirebaseFirestore.instance.collection('Pedometer');
    // Call the user's CollectionReference to add a new user
    await users.doc(docname).set({
      'Email': FirebaseAuth.instance.currentUser!.email!,
      'NoOfSteps': noofsteps.toString(),
      'Kilo Meters': kilos.toString()
    });
    // final QuerySnapshot result = await FirebaseFirestore.instance
    //     .collection('Pedometer')
    //     .where('Email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
    //     .get();
    // final QuerySnapshot result2 = await FirebaseFirestore.instance
    //     .collection('Pedometer')
    //     .where('Date', isEqualTo: getCurrentDate())
    //     .get();
    // if (result.docs.length > 0 && result2.docs.length > 0) {
    //   print('MK');
    //   FirebaseFirestore.instance
    //       .collection('rackBookItems')
    //       .doc('book1')
    //       .update({'newData': 14});
    // } else {
    //   Map<String, String> dataToSave = {
    //     'Email': FirebaseAuth.instance.currentUser!.email!,
    //     'Steps': noofsteps.toString(),
    //     'Date': "${getCurrentDate()}"
    //   };
    //   FirebaseFirestore.instance.collection('Pedometer').add(dataToSave);
    print('Save Data');
  }
}
