// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_is_empty, unnecessary_brace_in_string_interps, use_build_context_synchronously, iterable_contains_unrelated_type, duplicate_ignore, avoid_print, unused_element, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitfat/models/auth.dart';
import 'package:fitfat/screens/Workout_Demo.dart';
import 'package:fitfat/screens/YogaVideos/childpose.dart';
import 'package:fitfat/screens/childpose.dart';
import 'package:fitfat/screens/home_screen.dart';
import 'package:fitfat/screens/mk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class YOGA extends StatelessWidget {
  YOGA();

  final AuthService _auth = new AuthService();
  getCurrentDate() {
    var date = DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

    return formattedDate;
  }

  Future refresh() async {}

  void sendDataToFirebase() async {
    FirebaseFirestore.instance
        .collection('data')
        .add({'timestamp': FieldValue.serverTimestamp()});
  }

  @override
  Widget build(BuildContext context) {
    final Header = Material(
      child: Column(
        children: [
          Container(
            height: 50,
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
                    Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Workout()));
                  },
                )),
                SizedBox(width: 85),
                Container(
                  width: 135,
                  child: Text(
                    'YOGA',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
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
              child: Image.asset(
                'assets/images/mk1.png',
              ),
            ),
          ],
        ),
      ),
    );

    final ChilPose = Material(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text(
              'YOGA EXERCISES',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 1,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: InkWell(
              child: Container(
                height: 100,
                width: 345,
                //color: Colors.red,
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

                child: Row(
                  children: [
                    Container(
                      width: 200,
                      //color: Colors.black,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 10.0),
                            height: 50,
                            width: 290,
                            alignment: Alignment.centerLeft,
                            //color: Colors.white,
                            child: Text(
                              'CHILD POSE',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10.0),
                            height: 50,
                            width: 290,
                            //color: Colors.red,
                            child: Text(
                              'EXERCISE 1',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                  color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 70.0),
                      width: 45,
                      //color: Colors.orange,
                      child: Icon(
                        Icons.play_circle_fill_sharp,
                        color: Colors.pinkAccent,
                        size: 70,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: (() async {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => VideoDisplay()));
                final QuerySnapshot result = await FirebaseFirestore.instance
                    .collection('Yoga')
                    .where('Email',
                        isEqualTo: FirebaseAuth.instance.currentUser!.email)
                    .get();
                final QuerySnapshot result2 = await FirebaseFirestore.instance
                    .collection('Yoga')
                    .where('Date', isEqualTo: getCurrentDate())
                    .get();
                if (result.docs.length > 0 && result2.docs.length > 0) {
                  print('MK');
                } else {
                  Map<String, String> dataToSave = {
                    'Email': FirebaseAuth.instance.currentUser!.email!,
                    'Exercise': 'ChildPose',
                    'Date': "${getCurrentDate()}"
                  };
                  FirebaseFirestore.instance.collection('Yoga').add(dataToSave);
                  print('Save Data');
                }
                // Map<String, String> dataToSave = {
                //   'Email': FirebaseAuth.instance.currentUser!.email!,
                //   'Exercise': 'ChildPose',
                //   'Date': "${getCurrentDate()}"
                // };
                //  FirebaseFirestore.instance.collection('Yoga').add(dataToSave);
                //  print('Save Data');

                //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Yogaposeone()));
                //print("Current Date Time Is${getCurrentDate()}");

                // var a = await FirebaseFirestore.instance
                //     .collection('Yoga')
                //     .doc(FirebaseAuth.instance.currentUser!.email)
                //     .get();

                // if (a.exists) {
                //   print('Exists');
                // } else {
                //   FirebaseFirestore.instance
                //       .collection('Yoga')
                //       .where('code', isEqualTo: getCurrentDate());
                //   if (getCurrentDate().exists) {
                //     print('Same Date Already Exist');
                //   } else {
                //     await FirebaseFirestore.instance
                //         .collection('Yoga')
                //         .doc((FirebaseAuth.instance.currentUser!.email))
                //         .set({
                //       'Email': FirebaseAuth.instance.currentUser!.email!,
                //       'Date': getCurrentDate(),
                //     });
                //     print('Data Inserted');
                //   }
                // }

                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => Yogaposeone()));

                // await FirebaseFirestore.instance.collection('Yoga').doc().set({
                //   'Email': FirebaseAuth.instance.currentUser!.email!,
                //   'Date': getCurrentDate(),
                // });
                // Map<String, String> dataToSave = {
                //   'Email': FirebaseAuth.instance.currentUser!.email!,
                //   'Exercise': 'ChildPose',
                //   'Date': "${currentDateTime}"
                // };
                // FirebaseFirestore.instance.collection('Yoga').add(dataToSave);

                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => Yogaposeone()));
              }),
            ),
          ),
          
          SizedBox(
            height: 20,
          ),
          Container(
            child: InkWell(
              child: Container(
                height: 100,
                width: 345,
                //color: Colors.red,
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

                child: Row(
                  children: [
                    Container(
                      width: 200,
                      //color: Colors.black,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 10.0),
                            height: 50,
                            width: 290,
                            alignment: Alignment.centerLeft,
                            //color: Colors.white,
                            child: Text(
                              'CHILD POSE',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10.0),
                            height: 50,
                            width: 290,
                            //color: Colors.red,
                            child: Text(
                              'EXERCISE 1',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                  color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 70.0),
                      width: 45,
                      //color: Colors.orange,
                      child: Icon(
                        Icons.play_circle_fill_sharp,
                        color: Colors.pinkAccent,
                        size: 70,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: (() async {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => VideoDisplay()));
                final QuerySnapshot result = await FirebaseFirestore.instance
                    .collection('Yoga')
                    .where('Email',
                        isEqualTo: FirebaseAuth.instance.currentUser!.email)
                    .get();
                final QuerySnapshot result2 = await FirebaseFirestore.instance
                    .collection('Yoga')
                    .where('Date', isEqualTo: getCurrentDate())
                    .get();
                if (result.docs.length > 0 && result2.docs.length > 0) {
                  print('MK');
                } else {
                  Map<String, String> dataToSave = {
                    'Email': FirebaseAuth.instance.currentUser!.email!,
                    'Exercise': 'ChildPose',
                    'Date': "${getCurrentDate()}"
                  };
                  FirebaseFirestore.instance.collection('Yoga').add(dataToSave);
                  print('Save Data');
                }
                // Map<String, String> dataToSave = {
                //   'Email': FirebaseAuth.instance.currentUser!.email!,
                //   'Exercise': 'ChildPose',
                //   'Date': "${getCurrentDate()}"
                // };
                //  FirebaseFirestore.instance.collection('Yoga').add(dataToSave);
                //  print('Save Data');

                //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Yogaposeone()));
                //print("Current Date Time Is${getCurrentDate()}");

                // var a = await FirebaseFirestore.instance
                //     .collection('Yoga')
                //     .doc(FirebaseAuth.instance.currentUser!.email)
                //     .get();

                // if (a.exists) {
                //   print('Exists');
                // } else {
                //   FirebaseFirestore.instance
                //       .collection('Yoga')
                //       .where('code', isEqualTo: getCurrentDate());
                //   if (getCurrentDate().exists) {
                //     print('Same Date Already Exist');
                //   } else {
                //     await FirebaseFirestore.instance
                //         .collection('Yoga')
                //         .doc((FirebaseAuth.instance.currentUser!.email))
                //         .set({
                //       'Email': FirebaseAuth.instance.currentUser!.email!,
                //       'Date': getCurrentDate(),
                //     });
                //     print('Data Inserted');
                //   }
                // }

                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => Yogaposeone()));

                // await FirebaseFirestore.instance.collection('Yoga').doc().set({
                //   'Email': FirebaseAuth.instance.currentUser!.email!,
                //   'Date': getCurrentDate(),
                // });
                // Map<String, String> dataToSave = {
                //   'Email': FirebaseAuth.instance.currentUser!.email!,
                //   'Exercise': 'ChildPose',
                //   'Date': "${currentDateTime}"
                // };
                // FirebaseFirestore.instance.collection('Yoga').add(dataToSave);

                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => Yogaposeone()));
              }),
            ),
          ),
          
          SizedBox(
            height: 20,
          ),
          Container(
            child: InkWell(
              child: Container(
                height: 100,
                width: 345,
                //color: Colors.red,
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

                child: Row(
                  children: [
                    Container(
                      width: 200,
                      //color: Colors.black,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 10.0),
                            height: 50,
                            width: 290,
                            alignment: Alignment.centerLeft,
                            //color: Colors.white,
                            child: Text(
                              'CHILD POSE',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10.0),
                            height: 50,
                            width: 290,
                            //color: Colors.red,
                            child: Text(
                              'EXERCISE 1',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                  color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 70.0),
                      width: 45,
                      //color: Colors.orange,
                      child: Icon(
                        Icons.play_circle_fill_sharp,
                        color: Colors.pinkAccent,
                        size: 70,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: (() async {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => VideoDisplay()));
                final QuerySnapshot result = await FirebaseFirestore.instance
                    .collection('Yoga')
                    .where('Email',
                        isEqualTo: FirebaseAuth.instance.currentUser!.email)
                    .get();
                final QuerySnapshot result2 = await FirebaseFirestore.instance
                    .collection('Yoga')
                    .where('Date', isEqualTo: getCurrentDate())
                    .get();
                if (result.docs.length > 0 && result2.docs.length > 0) {
                  print('MK');
                } else {
                  Map<String, String> dataToSave = {
                    'Email': FirebaseAuth.instance.currentUser!.email!,
                    'Exercise': 'ChildPose',
                    'Date': "${getCurrentDate()}"
                  };
                  FirebaseFirestore.instance.collection('Yoga').add(dataToSave);
                  print('Save Data');
                }
                // Map<String, String> dataToSave = {
                //   'Email': FirebaseAuth.instance.currentUser!.email!,
                //   'Exercise': 'ChildPose',
                //   'Date': "${getCurrentDate()}"
                // };
                //  FirebaseFirestore.instance.collection('Yoga').add(dataToSave);
                //  print('Save Data');

                //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Yogaposeone()));
                //print("Current Date Time Is${getCurrentDate()}");

                // var a = await FirebaseFirestore.instance
                //     .collection('Yoga')
                //     .doc(FirebaseAuth.instance.currentUser!.email)
                //     .get();

                // if (a.exists) {
                //   print('Exists');
                // } else {
                //   FirebaseFirestore.instance
                //       .collection('Yoga')
                //       .where('code', isEqualTo: getCurrentDate());
                //   if (getCurrentDate().exists) {
                //     print('Same Date Already Exist');
                //   } else {
                //     await FirebaseFirestore.instance
                //         .collection('Yoga')
                //         .doc((FirebaseAuth.instance.currentUser!.email))
                //         .set({
                //       'Email': FirebaseAuth.instance.currentUser!.email!,
                //       'Date': getCurrentDate(),
                //     });
                //     print('Data Inserted');
                //   }
                // }

                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => Yogaposeone()));

                // await FirebaseFirestore.instance.collection('Yoga').doc().set({
                //   'Email': FirebaseAuth.instance.currentUser!.email!,
                //   'Date': getCurrentDate(),
                // });
                // Map<String, String> dataToSave = {
                //   'Email': FirebaseAuth.instance.currentUser!.email!,
                //   'Exercise': 'ChildPose',
                //   'Date': "${currentDateTime}"
                // };
                // FirebaseFirestore.instance.collection('Yoga').add(dataToSave);

                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => Yogaposeone()));
              }),
            ),
          ),
          
          SizedBox(
            height: 20,
          ),
          Container(
            child: InkWell(
              child: Container(
                height: 100,
                width: 345,
                //color: Colors.red,
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

                child: Row(
                  children: [
                    Container(
                      width: 200,
                      //color: Colors.black,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 10.0),
                            height: 50,
                            width: 290,
                            alignment: Alignment.centerLeft,
                            //color: Colors.white,
                            child: Text(
                              'CHILD POSE',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10.0),
                            height: 50,
                            width: 290,
                            //color: Colors.red,
                            child: Text(
                              'EXERCISE 1',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                  color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 70.0),
                      width: 45,
                      //color: Colors.orange,
                      child: Icon(
                        Icons.play_circle_fill_sharp,
                        color: Colors.pinkAccent,
                        size: 70,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: (() async {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => VideoDisplay()));
                final QuerySnapshot result = await FirebaseFirestore.instance
                    .collection('Yoga')
                    .where('Email',
                        isEqualTo: FirebaseAuth.instance.currentUser!.email)
                    .get();
                final QuerySnapshot result2 = await FirebaseFirestore.instance
                    .collection('Yoga')
                    .where('Date', isEqualTo: getCurrentDate())
                    .get();
                if (result.docs.length > 0 && result2.docs.length > 0) {
                  print('MK');
                } else {
                  Map<String, String> dataToSave = {
                    'Email': FirebaseAuth.instance.currentUser!.email!,
                    'Exercise': 'ChildPose',
                    'Date': "${getCurrentDate()}"
                  };
                  FirebaseFirestore.instance.collection('Yoga').add(dataToSave);
                  print('Save Data');
                }
                // Map<String, String> dataToSave = {
                //   'Email': FirebaseAuth.instance.currentUser!.email!,
                //   'Exercise': 'ChildPose',
                //   'Date': "${getCurrentDate()}"
                // };
                //  FirebaseFirestore.instance.collection('Yoga').add(dataToSave);
                //  print('Save Data');

                //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Yogaposeone()));
                //print("Current Date Time Is${getCurrentDate()}");

                // var a = await FirebaseFirestore.instance
                //     .collection('Yoga')
                //     .doc(FirebaseAuth.instance.currentUser!.email)
                //     .get();

                // if (a.exists) {
                //   print('Exists');
                // } else {
                //   FirebaseFirestore.instance
                //       .collection('Yoga')
                //       .where('code', isEqualTo: getCurrentDate());
                //   if (getCurrentDate().exists) {
                //     print('Same Date Already Exist');
                //   } else {
                //     await FirebaseFirestore.instance
                //         .collection('Yoga')
                //         .doc((FirebaseAuth.instance.currentUser!.email))
                //         .set({
                //       'Email': FirebaseAuth.instance.currentUser!.email!,
                //       'Date': getCurrentDate(),
                //     });
                //     print('Data Inserted');
                //   }
                // }

                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => Yogaposeone()));

                // await FirebaseFirestore.instance.collection('Yoga').doc().set({
                //   'Email': FirebaseAuth.instance.currentUser!.email!,
                //   'Date': getCurrentDate(),
                // });
                // Map<String, String> dataToSave = {
                //   'Email': FirebaseAuth.instance.currentUser!.email!,
                //   'Exercise': 'ChildPose',
                //   'Date': "${currentDateTime}"
                // };
                // FirebaseFirestore.instance.collection('Yoga').add(dataToSave);

                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => Yogaposeone()));
              }),
            ),
          ),
        ],
      ),
    );

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
              'WORKOUT',
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
                    ChilPose,
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
// Future<bool> doesNameAlreadyExist(String name) async {
//   final QuerySnapshot result = await FirebaseFirestore.instance
//   .collection('Yoga').where('name', isEqualTo: name).limit(1).get();
//   final List<DocumentSnapshot> documents = result.docs;
//   if (documents.length > 0) { 

//   //exists

// } else {  

//   //not exists

// }
//   return documents.length == 1;
// }



                // Future<bool> doesNameAlreadyExist(String name) async {
                //   final QuerySnapshot result = await FirebaseFirestore.instance
                //       .collection('Yoga')
                //       .where('name', isEqualTo: name)
                //       .limit(1)
                //       .get();
                //   final List<DocumentSnapshot> documents = result.docs;
                //   if (documents.length > 0) {
                //     // ignore: iterable_contains_unrelated_type
                //     if (documents
                //         .contains(FirebaseAuth.instance.currentUser!.email!)) {
                //       if (documents.contains("${currentDateTime}")) {
                //         Navigator.of(context).push(MaterialPageRoute(
                //             builder: (context) => Yogaposeone()));
                //         print("Current Date Time Is${currentDateTime}");
                //       }
                //     }
                //   } else {
                //     Map<String, String> dataToSave = {
                //       'Email': FirebaseAuth.instance.currentUser!.email!,
                //       'Exercise': 'ChildPose',
                //       'Date': "${currentDateTime}"
                //     };
                //     FirebaseFirestore.instance
                //         .collection('Yoga')
                //         .add(dataToSave);

                //     Navigator.of(context).push(
                //         MaterialPageRoute(builder: (context) => Yogaposeone()));
                //     print("Current Date Time Is${currentDateTime}");
                //   }
                //   return documents.length == 1;
                // }