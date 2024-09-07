// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:convert';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitfat/models/auth.dart';
import 'package:fitfat/screens/childpose.dart';
import 'package:fitfat/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class TakeWeight extends StatefulWidget {
  TakeWeight();

  @override
  State<TakeWeight> createState() => _TakeWeightState();
}

class _TakeWeightState extends State<TakeWeight> {
  final AuthService _auth = new AuthService();

  DateTime currentDateTime = DateTime.now();

  List<String> items = <String>['Red', 'Blue', 'Green'];

  String DropdownValue = 'Red';

  final _username = TextEditingController();
  final _currentweight = TextEditingController();
  final _gender = TextEditingController();
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? gender;

  Future refresh() async {}

  void sendDataToFirebase() async {
    FirebaseFirestore.instance
        .collection('data')
        .add({'timestamp': FieldValue.serverTimestamp()});
  }

  @override
  Widget build(BuildContext context) {
    final UserField = TextFormField(
      controller: _username,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
          if (value.trim().length < 8) {
            return 'Password must be at least 8 characters in length';
          }
          // Return null if the entered password is valid
          return null;
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Username",
          hintStyle: (TextStyle(color: Colors.grey)),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.cyan),
          ),
        ));

    final WeightField = TextFormField(
      controller: _currentweight,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
          if (value.trim().length < 8) {
            return 'Password must be at least 8 characters in length';
          }
          // Return null if the entered password is valid
          return null;
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.add_circle_outline_rounded),
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Current Weight",
          hintStyle: (TextStyle(color: Colors.grey)),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.cyan),
          ),
        ));

    final DropdownValue = Material(
        child: Column(
      children: [
        RadioListTile(
          title: Text("Male"),
          value: "male",
          groupValue: gender,
          onChanged: (value) {
            setState(() {
              gender = value.toString();
            });
          },
        ),
        RadioListTile(
          title: Text("Female"),
          value: "female",
          groupValue: gender,
          onChanged: (value) {
            setState(() {
              gender = value.toString();
            });
          },
        ),
        RadioListTile(
          title: Text("Other"),
          value: "other",
          groupValue: gender,
          onChanged: (value) {
            setState(() {
              gender = value.toString();
            });
          },
        )
      ],
    ));
    

    final SubmitButtin = TextButton(
        onPressed: () {
          Map<String, String> dataToSave = {
                  // 'Username':_username.text,
                  // 'Weight': _currentweight.text,
                  // 'Email': FirebaseAuth.instance.currentUser!.email!,
                  // 'Gender': gender.toString(),
                  'ProfilePic': 'assets/images/mk1.png'
                };
                 FirebaseFirestore.instance.collection('UserInfo').add(dataToSave);
        },
        child: const Text(
          'Submit',
          style: TextStyle(
            color: Colors.black,
            backgroundColor: Colors.red,
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
            // child: InkWell(
            //     child: Container(
            //       child: ProfilePicture(
            //         name: FirebaseAuth.instance.currentUser!.email!,
            //         radius: 16,
            //         fontsize: 15,
            //         random: true,
            //         count: 2,
            //         tooltip: true,
            //         //role: 'ADMINISTRATOR',
            //         img: (FirebaseAuth.instance.currentUser?.photoURL),
            //         //img: 'https://avatars.githubusercontent.com/u/37553901?v=4',
            //       ),
            //     ),
            //     onTap: () {
            //       // Navigator.push(context,
            //       //     MaterialPageRoute(builder: (context) => WelcomeScreen()));
            //     }),
          ),
          Container(
            margin: const EdgeInsets.only(left: 0.0, right: 75.0),
            //padding: const EdgeInsets.only(left: 20.0, right: 0.0),
            alignment: Alignment.center,
            child: Text(
              'WELCOME',
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
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
              // child: Text(
              //   'GET PRO',
              //   style: GoogleFonts.roboto(
              //     fontWeight: FontWeight.w900,
              //     textStyle: TextStyle(
              //       fontSize: 11,
              //       fontWeight: FontWeight.bold,
              //       background: Paint()
              //         ..color = Colors.lightBlue.shade300
              //         ..strokeWidth = 14
              //         ..strokeJoin = StrokeJoin.round
              //         //..strokeCap = StrokeCap.round
              //         ..style = PaintingStyle.stroke,
              //     ),
              //   ),
              //   textAlign: TextAlign.center,
              // ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 0.0, right: 5.0),
            // child: IconButton(
            //     icon: Icon(
            //       Icons.notifications_none,
            //       color: Colors.black54,
            //       size: 33,
            //     ),
            //     onPressed: () {}),
          ),
        ],
        backgroundColor: Colors.white,
        //centerTitle: true,
      ),
      // bottomNavigationBar: GNav(
      //   gap: 8,
      //   iconSize: 30,
      //   color: Colors.grey[800],
      //   backgroundColor: Colors.white,
      //   rippleColor: Colors.grey,
      //   activeColor: Colors.pinkAccent,
      //   haptic: true, // haptic feedback
      //   hoverColor: Colors.black,
      //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      //   tabs: const [
      //     GButton(
      //       icon: Icons.home,
      //       text: 'Home',
      //     ),
      //     GButton(
      //       icon: Icons.bubble_chart,
      //       text: 'Workout',
      //     ),
      //     GButton(
      //       icon: Icons.food_bank,
      //       text: 'Meal',
      //     ),
      //     GButton(
      //       icon: Icons.supervised_user_circle_rounded,
      //       text: 'Trainers',
      //     ),
      //   ],
      // ),
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
                    UserField,
                    WeightField,
                    DropdownValue,
                    SubmitButtin,
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
