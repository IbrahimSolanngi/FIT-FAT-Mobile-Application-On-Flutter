// ignore_for_file: prefer_const_constructors, unused_import, sort_child_properties_last

import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitfat/models/Auth.dart';
import 'package:fitfat/screens/Diet.dart';
import 'package:fitfat/screens/Trainer.dart';
import 'package:fitfat/screens/Workout_Demo.dart';
import 'package:fitfat/screens/home_screen.dart';
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

class UserRecord extends StatefulWidget {
  UserRecord();

  @override
  State<UserRecord> createState() => _HomeState();
}

class _HomeState extends State<UserRecord> {
//   @override
  final AuthService _auth = new AuthService();
  int _selectedIndex = 0;
  String Email = '';
  String Kilometers = '';
  String Steps = '';
  String Minutes = '';
  String yogadet = '';
  final Stream<QuerySnapshot> studentsStream =
      FirebaseFirestore.instance.collection('Yoga').snapshots();
  final Stream<QuerySnapshot> TrainerStream=
      FirebaseFirestore.instance.collection('TrainerHire').snapshots();
  final Stream<QuerySnapshot> PedometerStream =
      FirebaseFirestore.instance.collection('Pedometer').snapshots();

  // For Deleting User
  CollectionReference students = FirebaseFirestore.instance.collection('Yoga');
  getCurrentDate() {
    var date = DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

    final String uid;
    final firestoreInstance = FirebaseFirestore.instance;
    return formattedDate;
  }

  void _getdata() async {
    FirebaseFirestore.instance
        .collection('Pedometer')
        .doc(FirebaseAuth.instance.currentUser!.email! + getCurrentDate())
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

  void _getdata2() async {
    QuerySnapshot result = await FirebaseFirestore.instance
        .collection('Yoga')
        .where('Email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .get();
    (userData) {
      setState(() {
        Email = FirebaseAuth.instance.currentUser!.email!;
        yogadet = userData.data()!['Date'];
        //Minutes = userData.data()!['Dinner'];
      });
    };
  }

  void printData() async {
    var firebaseUser = await FirebaseAuth.instance.currentUser!;
    FirebaseFirestore.instance
        .collection("TrainerHire")
        .doc(FirebaseAuth.instance.currentUser!.email!)
        .get()
        .then((value) {
      print(value);
      value = yogadet.toString() as DocumentSnapshot<Map<String, dynamic>>;
    });
  }

  Future refresh() async {}

  @override
  void initState() {
    super.initState();
    _getdata();
    _getdata2();
    printData();
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
                    child: InkWell(
                      child: Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 0.0),
                        height: 30,
                        //color: Colors.black,
                        width: 92,
                        alignment: Alignment.center,
                        child: const Text(
                          'Activity',
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
    final Recordheading = Material(
      child: Column(
        children: [
          Container(
            child: Text(
              'User Information',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Text(Email.toString()),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text('Yoga History',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,)),
          ),
          Container(
              child: StreamBuilder<QuerySnapshot>(
                  stream: studentsStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      print('Something went Wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    FirebaseAuth.instance.currentUser!.email;

                    final List storedocs = [];
                    snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map a = document.data() as Map<String, dynamic>;
                      storedocs.add(a);
                    }).toList();

                    return Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Table(
                          border: TableBorder.all(),
                          columnWidths: const <int, TableColumnWidth>{
                            1: FixedColumnWidth(140),
                          },
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: [
                            TableRow(
                              children: [
                                TableCell(
                                  child: Container(
                                    color: Colors.greenAccent,
                                    child: Center(
                                      child: Text(
                                        'Date',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    color: Colors.greenAccent,
                                    child: Center(
                                      child: Text(
                                        'Email',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            for (var i = 0; i < storedocs.length; i++) ...[
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Center(
                                        child: Text(storedocs[i]['Date'],
                                            style: TextStyle(fontSize: 18.0))),
                                  ),
                                  TableCell(
                                    child: Center(
                                        child: Text(storedocs[i]['Email'],
                                            style: TextStyle(fontSize: 18.0))),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  })),
       
                 Container(
            child: Text('Pedometer History',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,)),
          ),
          Container(
              child: StreamBuilder<QuerySnapshot>(
                  stream: PedometerStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      print('Something went Wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    FirebaseAuth.instance.currentUser!.email;

                    final List storedocs = [];
                    snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map a = document.data() as Map<String, dynamic>;
                      storedocs.add(a);
                    }).toList();

                    return Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Table(
                          border: TableBorder.all(),
                          columnWidths: const <int, TableColumnWidth>{
                            1: FixedColumnWidth(140),
                          },
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: [
                            TableRow(
                              children: [
                                TableCell(
                                  child: Container(
                                    color: Colors.greenAccent,
                                    child: Center(
                                      child: Text(
                                        'Kilometers',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    color: Colors.greenAccent,
                                    child: Center(
                                      child: Text(
                                        'Steps',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            for (var i = 0; i < storedocs.length; i++) ...[
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Center(
                                        child: Text(storedocs[i]['Kilo Meters'],
                                            style: TextStyle(fontSize: 18.0))),
                                  ),
                                  TableCell(
                                    child: Center(
                                        child: Text(storedocs[i]['NoOfSteps'],
                                            style: TextStyle(fontSize: 18.0))),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  })),
                   Container(
            child: Text('Pedometer History',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,)),
          ),
          Container(
              child: StreamBuilder<QuerySnapshot>(
                  stream: TrainerStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      print('Something went Wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    FirebaseAuth.instance.currentUser!.email;

                    final List storedocs = [];
                    snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map a = document.data() as Map<String, dynamic>;
                      storedocs.add(a);
                    }).toList();

                    return Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Table(
                          border: TableBorder.all(),
                          columnWidths: const <int, TableColumnWidth>{
                            1: FixedColumnWidth(140),
                          },
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: [
                            TableRow(
                              children: [
                                TableCell(
                                  child: Container(
                                    color: Colors.greenAccent,
                                    child: Center(
                                      child: Text(
                                        'Kilometers',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    color: Colors.greenAccent,
                                    child: Center(
                                      child: Text(
                                        'Steps',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            for (var i = 0; i < storedocs.length; i++) ...[
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Center(
                                        child: Text(storedocs[i]['Email'],
                                            style: TextStyle(fontSize: 18.0))),
                                  ),
                                  TableCell(
                                    child: Center(
                                        child: Text(storedocs[i]['TrainerName'],
                                            style: TextStyle(fontSize: 18.0))),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  })),
      
        ],
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
                    SignOut,
                    Recordheading,
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
