// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitfat/models/auth.dart';
import 'package:fitfat/screens/childpose.dart';
import 'package:fitfat/screens/dietplan.dart';
import 'package:fitfat/screens/widget/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class DietUsers extends StatefulWidget {
  DietUsers();

  @override
  State<DietUsers> createState() => _DietUsersState();
}

class _DietUsersState extends State<DietUsers> {
  final AuthService _auth = new AuthService();

  final CollectionReference _Diet =
      FirebaseFirestore.instance.collection('DietPlan');

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  getCurrentDate() {
    var date = DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

    return formattedDate;
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email = '';
  String BreakFast = '';
  String Lunch = '';
  String Dinner = '';
  String Error = '';

  final _Breakfastinp = TextEditingController();
  final _Lunchinp = TextEditingController();
  final _Dinnerinp = TextEditingController();

  Future refresh() async {}

  void _getdata() async {
    FirebaseFirestore.instance
        .collection('DietPlan')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .snapshots()
        .listen((userData) {
      setState(() {
        email = FirebaseAuth.instance.currentUser!.email!;
        BreakFast = userData.data()!['BreakFast'];
        Lunch = userData.data()!['Lunch'];
        Dinner = userData.data()!['Dinner'];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getdata();
  }

  @override
  Widget build(BuildContext context) {
    final Header = Material(
      child: Column(
        children: [
          Container(
            height: 60,
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
                  },
                )),
                SizedBox(width: 85),
                Container(
                  child: Text(
                    'DIET SECTION',
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
          SizedBox(
            height: 25,
          ),
          Container(
            child: Column(
              children: [
                Container(
                  child: Text(
                    'Today Diet Plan',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    final Activity = Material(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 6.8, right: 0.0, top: 20),
            child: Transform.translate(
              offset: const Offset(0, 0),
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
                          // Image.asset('assets/images/bk.png',
                          //     height: 30, width: 30),
                          // const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "Break Fast",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.fade,
                              softWrap: false,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        BreakFast,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      Image.asset('assets/images/bk.png',
                          height: 100, width: 100),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, right: 0.0, top: 19.0),
            child: Transform.translate(
              offset: const Offset(0, 0),
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
                              Image.asset('assets/images/lunch.png',
                                  height: 50, width: 50),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  "Lunch",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            Lunch,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
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
                              Image.asset('assets/images/dinner.png',
                                  height: 50, width: 50),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  "Dinner",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            Dinner,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
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

    final AddDietPlan = Material(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 0.0, right: 5.0, top: 30.0),
            child: Text(
              'Add Your Diet',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.grey,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );

    final BreakfastField = TextFormField(
      controller: _Breakfastinp,
      autofocus: false,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Dinner field is required';
        }
        // Return null if the entered password is valid
        return null;
      },
      // ignore: prefer_const_constructors
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.add),
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "BreakFast",
        hintStyle: (TextStyle(color: Colors.grey)),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan),
        ),
      ),
    );
    final LunchField = TextFormField(
      controller: _Lunchinp,
      autofocus: false,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Dinner field is required';
        }
        // Return null if the entered password is valid
        return null;
      },
      // ignore: prefer_const_constructors
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.add),
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Lunch",
        hintStyle: (TextStyle(color: Colors.grey)),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan),
        ),
      ),
    );
    final DinnerField = TextFormField(
      controller: _Dinnerinp,
      autofocus: false,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Dinner field is required';
        }
        // Return null if the entered password is valid
        return null;
      },
      // ignore: prefer_const_constructors
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.add),
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Dinner",
        hintStyle: (TextStyle(color: Colors.grey)),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan),
        ),
      ),
    );

    final AddButton = Material(
        //elevation: 5.0,
        //borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
      minWidth: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      onPressed: () async {
        CollectionReference diet =
            FirebaseFirestore.instance.collection('DietPlan');
        await diet.doc(FirebaseAuth.instance.currentUser!.email).set({
          'Email': FirebaseAuth.instance.currentUser!.email!,
          'BreakFast': _Breakfastinp.text,
          'Lunch': _Lunchinp.text,
          'Dinner': _Dinnerinp.text,
          'Date': "${getCurrentDate()}"
        });
        _Breakfastinp.clear();
          _Lunchinp.clear();
          _Dinnerinp.clear();
        // final QuerySnapshot result = await FirebaseFirestore.instance
        //     .collection('DietPlan')
        //     .where('Email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
        //     .get();
        // final QuerySnapshot result2 = await FirebaseFirestore.instance
        //     .collection('DietPlan')
        //     .where('Date', isEqualTo: 'MK')
        //     .get();
        // if (result.docs.length > 0 && result2.docs.length > 0) {
        //   print('Record Already Exist');
        //   // FirebaseFirestore.instance.collection('DietPlan').doc(email).update({
        //   //   'BreakFast': _Breakfastinp.text,
        //   //   'Lunch': _Lunchinp.text,
        //   //   'Dinner': _Dinnerinp.text,
        //   // });

        //   _Breakfastinp.clear();
        //   _Lunchinp.clear();
        //   _Dinnerinp.clear();
        // } else {
        //   CollectionReference diet =
        //       FirebaseFirestore.instance.collection('DietPlan');
        //   // Call the user's CollectionReference to add a new user
        //   await diet.doc(email).set({
        //     'Email': FirebaseAuth.instance.currentUser!.email!,
        //     'BreakFast': _Breakfastinp.text,
        //     'Lunch': _Lunchinp.text,
        //     'Dinner': _Dinnerinp.text,
        //     'Date': "${getCurrentDate()}"
        //   });
        //   _Breakfastinp.clear();
        //   _Lunchinp.clear();
        //   _Dinnerinp.clear();

        // Map<String, String> dataToSave = {
        //   'Email': FirebaseAuth.instance.currentUser!.email!,
        //   'BreakFast': _Breakfastinp.text,
        //   'Lunch': _Lunchinp.text,
        //   'Dinner': _Dinnerinp.text,
        //   'Date': "${getCurrentDate()}"
        //};
        //FirebaseFirestore.instance.collection('DietPlan').add(dataToSave);
        //}
      },
      child: Container(
        height: 50,
        width: 200,
        padding: EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 6.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.orangeAccent, Colors.pinkAccent]),
            borderRadius: BorderRadius.circular(25.0)),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'ADD',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    ));

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
            onTap: () {},
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
                    Activity,
                    AddDietPlan,
                    BreakfastField,
                    LunchField,
                    DinnerField,
                    AddButton,
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
