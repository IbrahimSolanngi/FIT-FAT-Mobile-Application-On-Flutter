// ignore_for_file: prefer_const_constructors, unused_import, sort_child_properties_last

import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitfat/models/Auth.dart';
import 'package:fitfat/screens/Diet.dart';
import 'package:fitfat/screens/Trainer.dart';
import 'package:fitfat/screens/Workout_Demo.dart';
import 'package:fitfat/screens/pedometer.dart';
import 'package:fitfat/screens/splash_screen.dart';
import 'package:fitfat/screens/welcome_screen.dart';
import 'package:fitfat/screens/widget/containerButton.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:group_button/group_button.dart';
import 'package:transparent_image_button/transparent_image_button.dart';
import 'package:badges/badges.dart';
import 'package:icony/icony_gameicons.dart';
import 'package:icony/icony_ikonate.dart';

import 'childpose.dart';

class Home extends StatefulWidget {
  Home();

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
//   @override
  final AuthService _auth = new AuthService();
  int _selectedIndex = 0;
  String Email='';
  String Kilometers = '';
  String Steps = '';
  String Minutes = '';
getCurrentDate() {
    var date = DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

    return formattedDate;
  }

  void _getdata() async {
    FirebaseFirestore.instance
        .collection('Pedometer')
        .doc(FirebaseAuth.instance.currentUser!.email!+getCurrentDate())
        .snapshots()
        .listen((userData) {
      setState(() {
        Email = FirebaseAuth.instance.currentUser!.email!;
        Kilometers = userData.data()!['Kilo Meters'];
        Steps = userData.data()!['NoOfSteps'];
        //Minutes = userData.data()!['Dinner'];
      });
    });
  }

  Future refresh() async {}

 @override
  void initState() {
    super.initState();
    _getdata();
  }

  @override
  Widget build(BuildContext context) {
    final SignOut = Material(
      child: IconButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WelcomeScreen()),
          );
          await GoogleSignIn().signOut();
          await _auth.signOut();
        },
        icon: Icon(Icons.power_settings_new),
      ),
    );
    final Header = Material(
      child: Column(
        children: <Widget>[
          Container(
            height: 140,
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
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  child: Container(
                    alignment: Alignment.center,
                    height: 65,
                    width: 180,
                    color: Colors.black.withOpacity(0.3),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 70,
                                // child: Badge(
                                //   badgeContent: Text(
                                //     '1',
                                //     style: TextStyle(
                                //         backgroundColor: Colors.red,
                                //         color: Colors.white),
                                //   ),
                                //   child: Container(
                                //     margin: const EdgeInsets.only(
                                //         left: 20.0, right: 0.0),
                                //     child: CircleAvatar(
                                //       radius: 20,
                                //       backgroundColor: Colors.white,
                                //       child: Padding(
                                //         padding: const EdgeInsets.all(
                                //             8), // Border radius
                                //         child: ClipOval(
                                //           child: Image.asset(
                                //             'assets/images/streak.png',
                                //             height: 50.0,
                                //             width: 50.0,
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 20.0, right: 0.0),
                                width: 100,
                                alignment: Alignment.center,
                                child: Center(
                                  child: Text(
                                    'Keep It Going! Streak',
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: Container(
                    alignment: Alignment.center,
                    height: 65,
                    width: 180,
                    color: Colors.black.withOpacity(0.3),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 70,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 20.0, right: 0.0),
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(
                                          8), // Border radius
                                      child: ClipOval(
                                        child: Image.asset(
                                          'assets/images/workout.png',
                                          height: 50.0,
                                          width: 50.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 00.0, right: 0.0),
                                width: 95,
                                alignment: Alignment.center,
                                child: Center(
                                  child: Text(
                                    '0 / 5\nWorkout',
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 0.0, right: .0),
                                child: Icon(
                                  // <-- Icon
                                  Icons.keyboard_arrow_right_sharp,
                                  color: Colors.white.withOpacity(0.7),
                                  size: 24.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: const Offset(0, -60),
            child: Container(
              height: 40,
              width: 293,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                //color: Colors.black.withOpacity(0.3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 5.0, right: 0.0),
                    height: 30,
                    width: 92,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      //color: Colors.black.withOpacity(0.3),
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        BoxShadow(
                          color: Colors.transparent,
                          spreadRadius: 3,
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                      ),
                      child: const Text(
                        'ACTIVITY',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      margin: const EdgeInsets.only(left: 5.0, right: 0.0),
                      height: 30,
                      //color: Colors.black,
                      width: 92,
                      alignment: Alignment.center,
                      child: const Text(
                        'FIT PEDO',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white60,
                        ),
                      ),
                    ),
                    onTap: () {
                      print("tapped on container");
                    },
                  ),
                  InkWell(
                    child: Container(
                      margin: const EdgeInsets.only(left: 5.0, right: 0.0),
                      height: 30,
                      //color: Colors.black,
                      width: 92,
                      alignment: Alignment.center,
                      child: const Text(
                        'RECORD',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white60,
                        ),
                      ),
                    ),
                    onTap: () {
                      print("tapped on container");
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    final Activity = Material(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10.0, right: 0.0),
            child: Transform.translate(
              offset: const Offset(0, -38),
              child: Container(
                height: 244,
                width: 145,
                alignment: Alignment.topLeft,
                color: Colors.white,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  height: 250,
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.12),
                        blurRadius: 5.0,
                        spreadRadius: 1.1,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Image.asset('assets/images/muscle.png',
                              height: 30, width: 30),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "Finished",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.fade,
                              softWrap: false,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        Kilometers,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Kilometers Completed',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, right: 0.0),
            child: Transform.translate(
              offset: const Offset(0, -40),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    height: 120,
                    width: 190,
                    alignment: Alignment.topLeft,
                    color: Colors.white,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      //height: 250,
                      //width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.12),
                            blurRadius: 5.0,
                            spreadRadius: 1.1,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Image.asset('assets/images/run.png',
                                  height: 30, width: 30),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  "Steps",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            Steps,
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Steps Completed',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    height: 120,
                    width: 190,
                    alignment: Alignment.topLeft,
                    color: Colors.white,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      //height: 250,
                      //width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.12),
                            blurRadius: 5.0,
                            spreadRadius: 1.1,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Image.asset('assets/images/clock.png',
                                  height: 30, width: 30),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  "Time Spent",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            Minutes,
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Minutes',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    final HeadingSection = Material(
      child: Transform.translate(
        offset: const Offset(0, -25),
        child: Container(
          height: 40,
          width: 350,
          //color: Colors.red,
          child: Row(
            children: [
              Container(
                width: 290,
                //color: Colors.lightBlue,
                child: Text(
                  'Explore Fit EX',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                width: 60,
                //color: Colors.green,
                child: InkWell(
                    child: Container(
                      child: Text(
                        'See all',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ),
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => WelcomeScreen()));
                    }),
              ),
            ],
          ),
        ),
      ),
    );

    // final PedometerSection = Material(
    //   child: Transform.translate(
    //     offset: const Offset(0, -25),
    //     child: Column(
    //       children: [
    //         Container(
    //           height: 40,
    //           width: 400,
    //           //color: Colors.pinkAccent,
    //           child: GestureDetector(
    //             onTap: () {
    //               // Navigator.of(context).push(MaterialPageRoute(
    //               //     builder: (context) => PedometerFunction()));
    //             },
    //             child: Container(
    //               //margin: const EdgeInsets.only(left: 38.0, right: 6.0),
    //               //padding: const EdgeInsets.only(left: 20.0, right: 0.0),
    //               alignment: Alignment.center,
    //               child: Text(
    //                 'SET GOALS',
    //                 style: GoogleFonts.roboto(
    //                   fontWeight: FontWeight.w900,
    //                   textStyle: TextStyle(
    //                     fontSize: 11,
    //                     color: Colors.white,
    //                     fontWeight: FontWeight.bold,
    //                     background: Paint()
    //                       ..color = Colors.pinkAccent
    //                       ..strokeWidth = 14
    //                       ..strokeJoin = StrokeJoin.round
    //                       //..strokeCap = StrokeCap.round
    //                       ..style = PaintingStyle.stroke,
    //                   ),
    //                 ),
    //                 textAlign: TextAlign.center,
    //               ),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    final DiscoverSection = Material(
      child: Transform.translate(
        offset: const Offset(0, -25),
        child: Container(
          height: 200,
          width: 350,
          //color: Colors.red,
          child: Center(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  color: Colors.white,
                  width: 350,
                  height: 120,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      //height: 200,
                      // child: Text(
                      //   "Long text here which is longer than the container height",
                      //   style: TextStyle(fontSize: 20),
                      // )
                      child: Row(
                        children: [
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                // ignore: prefer_const_literals_to_create_immutables
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 252, 183, 79),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.12),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.1,
                                  ),
                                ],
                              ),
                              //color: Colors.orangeAccent,
                              height: 160,
                              width: 180,

                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    //color: Colors.black,
                                    height: 180,
                                    width: 100,
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              right: 10.0),
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          //color: Colors.pink,
                                          height: 40,
                                          width: 100,
                                          child: Text(
                                            'YOGA',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              letterSpacing: 1.3,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 2.0),
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          //color: Colors.orange,
                                          height: 70,
                                          width: 100,
                                          child: Text(
                                            '3 Exercises',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              //fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              letterSpacing: 1.3,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    alignment: Alignment.topLeft,
                                    //color: Colors.red,
                                    height: 300,
                                    width: 80,
                                    child: Image.asset(
                                      'assets/images/Yoga-PNG-Picture.png',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Yogaposeone()));
                            },
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                // ignore: prefer_const_literals_to_create_immutables
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 92, 155, 164),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.12),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.1,
                                  ),
                                ],
                              ),
                              //color: Colors.orangeAccent,
                              height: 160,
                              width: 180,

                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    //color: Colors.black,
                                    height: 180,
                                    width: 100,
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              right: 10.0),
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          //color: Colors.pink,
                                          height: 40,
                                          width: 100,
                                          child: Text(
                                            'YOGA',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              letterSpacing: 1.3,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 2.0),
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          //color: Colors.orange,
                                          height: 70,
                                          width: 100,
                                          child: Text(
                                            '3 Exercises',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              //fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              letterSpacing: 1.3,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    alignment: Alignment.topLeft,
                                    //color: Colors.red,
                                    height: 300,
                                    width: 80,
                                    child: Image.asset(
                                      'assets/images/yoga.png',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Yogaposeone()));
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                // ignore: prefer_const_literals_to_create_immutables
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.green.shade800,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.12),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.1,
                                  ),
                                ],
                              ),
                              //color: Colors.orangeAccent,
                              height: 160,
                              width: 180,

                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    //color: Colors.black,
                                    height: 180,
                                    width: 100,
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              right: 10.0),
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          //color: Colors.pink,
                                          height: 40,
                                          width: 100,
                                          child: Text(
                                            'YOGA',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              letterSpacing: 1.3,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 2.0),
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          //color: Colors.orange,
                                          height: 70,
                                          width: 100,
                                          child: Text(
                                            '3 Exercises',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              //fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              letterSpacing: 1.3,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    alignment: Alignment.topLeft,
                                    //color: Colors.red,
                                    height: 300,
                                    width: 80,
                                    child: Image.asset(
                                      'assets/images/climb.png',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Yogaposeone()));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    final CalenderHeadingSection = Material(
      child: Transform.translate(
        offset: const Offset(0, -75),
        child: Container(
          height: 40,
          width: 400,
          padding: const EdgeInsets.only(left: 30.0, right: 0.0),
          //color: Colors.red,
          child: Row(
            children: [
              Container(
                width: 230,
                //color: Colors.lightBlue,
                child: Text(
                  'FIT CALENDER',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                width: 100,
                //color: Colors.green,
                child: InkWell(
                    child: Container(
                      child: Text(
                        'See activities',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ),
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => WelcomeScreen()));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
    final CalnderPortal = Material(
      child: Transform.translate(
        offset: const Offset(0, -55),
        child: Container(
          height: 228,
          width: 400,
          //color: Colors.red,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  // ignore: prefer_const_literals_to_create_immutables
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  //color:Colors.pinkAccent,
                  //Color.fromARGB(255, 253, 160, 98),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 5.0,
                      spreadRadius: 1.1,
                    ),
                  ],
                ),
                //color: Colors.orangeAccent,
                height: 228,
                width: 300,

                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      //color: Colors.black,

                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 0.0),
                            padding: const EdgeInsets.only(top: 50.0),
                            //color: Colors.pink,
                            height: 180,
                            width: 200,
                            child: Text(
                              'ADD YOUR DAIRY LIFE SCHEDULE',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                textStyle:
                                    Theme.of(context).textTheme.headline4,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            //padding: const EdgeInsets.only(top: 10.0),
                            // height: 60,
                            width: 200,
                            child: Transform.translate(
                              offset: const Offset(0, -40),
                              //color: Colors.red,
                              child: FloatingActionButton.extended(
                                label: Text('Add Activities'),
                                elevation: 0, // <-- Text
                                //backgroundColor: Colors.black.withOpacity(0.5),
                                backgroundColor: Colors.pink.withOpacity(0.5),
                                foregroundColor: Colors.white,
                                extendedTextStyle: GoogleFonts.roboto(
                                  textStyle:
                                      Theme.of(context).textTheme.headline4,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                icon: Icon(
                                  // <-- Icon
                                  Icons.calendar_month_rounded,
                                  size: 24.0,
                                ),
                                onPressed: () {},
                                // onPressed: () {
                                //   Navigator.of(context).push(MaterialPageRoute(
                                //       builder: (context) => RegistrationScreen()));
                                // },
                                heroTag: BoxShadow(
                                  color: Colors.transparent,
                                  spreadRadius: 7,
                                  blurRadius: 7,
                                  offset: Offset(3, 5),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 50.0),
                      alignment: Alignment.topLeft,
                      //color: Colors.red,
                      height: 400,
                      width: 80,
                      child: Image.asset(
                        'assets/images/mk.png',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

    final Invitebutton = Material(
      child: Container(
        width: 300.0,
        child: Transform.translate(
          offset: const Offset(0, -10),
          child: FloatingActionButton.extended(
            label: Text('INVITE THE FRIENDS'),
            elevation: 0, // <-- Text
            //backgroundColor: Colors.black.withOpacity(0.5),
            backgroundColor: Colors.white.withOpacity(0.5),
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: Colors.grey, width: 0.5, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(50)),

            extendedTextStyle: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.headline4,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
            icon: Icon(
              // <-- Icon
              Icons.person_add,
              color: Colors.black,
              size: 24.0,
            ),
            onPressed: () {},
            heroTag: BoxShadow(
              color: Colors.transparent,
              spreadRadius: 7,
              blurRadius: 7,
              offset: Offset(3, 5),
            ),
          ),
        ),
      ),
    );
    final FooterText = Material(
      child: Transform.translate(
        offset: const Offset(0, 0),
        child: Container(
          //height: 230,
          width: 500,
          //color: Colors.red,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(50),
                child: Text(
                  'Help us get even better',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    final Feedbackbutton = Material(
      child: Container(
        width: 300.0,
        child: Transform.translate(
          offset: const Offset(0, -30),
          child: FloatingActionButton.extended(
            label: Text('GIVE FEEDBACK'),
            elevation: 0, // <-- Text
            //backgroundColor: Colors.black.withOpacity(0.5),
            backgroundColor: Colors.white.withOpacity(0.5),
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: Colors.grey, width: 0.5, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(50)),

            extendedTextStyle: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.headline4,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
            // icon: Icon(
            //   // <-- Icon
            //   Icons.person_add,
            //   color: Colors.black,
            //   size: 24.0,
            // ),
            onPressed: () {},
            heroTag: BoxShadow(
              color: Colors.transparent,
              spreadRadius: 7,
              blurRadius: 7,
              offset: Offset(3, 5),
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 0.0, right: 35.0),
            //padding: const EdgeInsets.only(left: 20.0, right: 0.0),
            alignment: Alignment.center,
            child: InkWell(
                child: Container(
                  child: ProfilePicture(
                    name: FirebaseAuth.instance.currentUser!.email!,
                    radius: 16,
                    fontsize: 15,
                    random: true,
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
            margin: const EdgeInsets.only(left: 50.0, right: 0.0),
            //padding: const EdgeInsets.only(left: 20.0, right: 0.0),
            alignment: Alignment.center,
            child: Text(
              'FOR YOU',
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
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PedometerFunction()));
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
              textColor: Colors.pinkAccent,
              iconColor: Colors.white,
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
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
              if (_selectedIndex == 0) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Home()));
                print(index);
              }
              if (_selectedIndex == 1) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Workout()));
              }
              if (_selectedIndex == 2) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => DietUsers()));
              }
              if (_selectedIndex == 3) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TrainersSection()));
              }
              print(index);
            });
          }),
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
                    Activity,
                    //PedometerSection,
                    HeadingSection,
                    DiscoverSection,
                    CalenderHeadingSection,
                    CalnderPortal,
                    Invitebutton,
                    FooterText,
                    Feedbackbutton,
                    SignOut,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
