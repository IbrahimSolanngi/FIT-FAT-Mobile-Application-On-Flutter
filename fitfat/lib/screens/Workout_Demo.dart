// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitfat/models/auth.dart';
import 'package:fitfat/screens/Pushups.dart';
import 'package:fitfat/screens/YogaVideos/childpose.dart';
import 'package:fitfat/screens/childpose.dart';
import 'package:fitfat/screens/yoga.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Workout extends StatelessWidget {
  Workout();

  final AuthService _auth = new AuthService();

  Future refresh() async {}

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
                    print("The icon is clicked");
                  },
                )),
                SizedBox(width: 85),
                Container(
                  child: Text(
                    'Daily Workout',
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
          Container(
            height: 100,
            width: 300,
            //color: Colors.red,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 5.0, right: 0.0),
            //padding: const EdgeInsets.only(left: 20.0, right: 0.0),
            child: Text(
              'Get our body changes within 6 weeks',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            //height: 100,
            width: 300,
            //color: Colors.red,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 5.0, right: 0.0),
            //padding: const EdgeInsets.only(left: 20.0, right: 0.0),
            child: Transform.translate(
              offset: const Offset(0, -10),
              child: Text(
                'Get your body shape moe fitter day by day by FIT FAT Workout plan of weekly. Stay connected with us for more details and workout plans. We bring a healthy life style for you.',
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          InkWell(
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
                            'YOGA',
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
                            '1 EXERCISES',
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
                    padding: const EdgeInsets.only(top: 0.0),
                    alignment: Alignment.topLeft,
                    //color: Colors.red,
                    // height: 300,
                    // width: 80,
                    child: Image.asset(
                      'assets/images/Yoga-PNG-Picture.png',
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 5.0),
                    width: 45,
                    //color: Colors.orange,
                    child: InkWell(
                      child: Icon(
                        Icons.arrow_circle_right,
                        color: Colors.pinkAccent,
                        size: 30,
                      ),
                      onTap: () {
                        //action code when clicked
                        print("The icon is clicked");
                      },
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => YOGA()));
            },
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
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
                            'PUSH UPS',
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
                            '1 EXERCISES',
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
                    padding: const EdgeInsets.only(top: 0.0),
                    alignment: Alignment.topLeft,
                    //color: Colors.red,
                    // height: 300,
                    // width: 80,
                    child: Image.asset(
                      'assets/images/pngegg.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 5.0),
                    width: 45,
                    //color: Colors.orange,
                    child: InkWell(
                      child: Icon(
                        Icons.arrow_circle_right,
                        color: Colors.pinkAccent,
                        size: 30,
                      ),
                      onTap: () {
                        //action code when clicked
                        print("The icon is clicked");
                      },
                    ),
                  ),
                ],
              ),
            ),
            onTap: (() {Navigator.of(context).push(MaterialPageRoute(builder: (context) => PushUps()));}),
          ),
          SizedBox(
            height: 10,
          ),
          // InkWell(
          //   child: Container(
          //     height: 100,
          //     width: 345,
          //     //color: Colors.red,
          //     decoration: BoxDecoration(
          //       // ignore: prefer_const_literals_to_create_immutables
          //       borderRadius: BorderRadius.circular(10),
          //       //color: Color.fromARGB(255, 92, 155, 164),
          //       color: Colors.white,
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.black.withOpacity(0.12),
          //           blurRadius: 5.0,
          //           spreadRadius: 1.1,
          //         ),
          //       ],
          //     ),
          //     child: Row(
          //       children: [
          //         Container(
          //           width: 200,
          //           //color: Colors.black,
          //           child: Column(
          //             children: [
          //               Container(
          //                 padding: const EdgeInsets.only(left: 10.0),
          //                 height: 50,
          //                 width: 290,
          //                 alignment: Alignment.centerLeft,
          //                 //color: Colors.white,
          //                 child: Text(
          //                   'CRUNCES',
          //                   textAlign: TextAlign.left,
          //                   style: TextStyle(
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 20,
          //                       color: Colors.black),
          //                 ),
          //               ),
          //               Container(
          //                 padding: const EdgeInsets.only(left: 10.0),
          //                 height: 50,
          //                 width: 290,
          //                 //color: Colors.red,
          //                 child: Text(
          //                   '1 EXERCISES',
          //                   textAlign: TextAlign.left,
          //                   style: TextStyle(
          //                       fontWeight: FontWeight.w900,
          //                       fontSize: 18,
          //                       color: Colors.grey),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //         Container(
          //           padding: const EdgeInsets.only(top: 0.0),
          //           alignment: Alignment.topLeft,
          //           //color: Colors.red,
          //           // height: 300,
          //           // width: 80,
          //           child: Image.asset(
          //             'assets/images/crunch.png',
          //             width: 100,
          //             height: 100,
          //           ),
          //         ),
          //         Container(
          //           padding: const EdgeInsets.only(left: 5.0),
          //           width: 45,
          //           //color: Colors.orange,
          //           child: InkWell(
          //             child: Icon(
          //               Icons.arrow_circle_right,
          //               color: Colors.pinkAccent,
          //               size: 30,
          //             ),
          //             onTap: () {
          //               //action code when clicked
          //               print("The icon is clicked");
          //             },
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          //   onTap: (() {}),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // InkWell(
          //   child: Container(
          //     height: 100,
          //     width: 345,
          //     //color: Colors.red,
          //     decoration: BoxDecoration(
          //       // ignore: prefer_const_literals_to_create_immutables
          //       borderRadius: BorderRadius.circular(10),
          //       //color: Color.fromARGB(255, 92, 155, 164),
          //       color: Colors.white,
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.black.withOpacity(0.12),
          //           blurRadius: 5.0,
          //           spreadRadius: 1.1,
          //         ),
          //       ],
          //     ),
          //     child: Row(
          //       children: [
          //         Container(
          //           width: 200,
          //           //color: Colors.black,
          //           child: Column(
          //             children: [
          //               Container(
          //                 padding: const EdgeInsets.only(left: 10.0),
          //                 height: 50,
          //                 width: 290,
          //                 alignment: Alignment.centerLeft,
          //                 //color: Colors.white,
          //                 child: Text(
          //                   'CLIMBERS',
          //                   textAlign: TextAlign.left,
          //                   style: TextStyle(
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 20,
          //                       color: Colors.black),
          //                 ),
          //               ),
          //               Container(
          //                 padding: const EdgeInsets.only(left: 10.0),
          //                 height: 50,
          //                 width: 290,
          //                 //color: Colors.red,
          //                 child: Text(
          //                   '1 EXERCISES',
          //                   textAlign: TextAlign.left,
          //                   style: TextStyle(
          //                       fontWeight: FontWeight.w900,
          //                       fontSize: 18,
          //                       color: Colors.grey),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //         Container(
          //           padding: const EdgeInsets.only(top: 0.0),
          //           alignment: Alignment.topLeft,
          //           //color: Colors.red,
          //           // height: 300,
          //           // width: 80,
          //           child: Image.asset(
          //             'assets/images/climb.png',
          //             width: 100,
          //             height: 100,
          //           ),
          //         ),
          //         Container(
          //           padding: const EdgeInsets.only(left: 5.0),
          //           width: 45,
          //           //color: Colors.orange,
          //           child: InkWell(
          //             child: Icon(
          //               Icons.arrow_circle_right,
          //               color: Colors.pinkAccent,
          //               size: 30,
          //             ),
          //             onTap: () {
          //               //action code when clicked
          //               print("The icon is clicked");
          //             },
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          //   onTap: (() {}),
          // ),
          //           SizedBox(
          //   height: 10,
          // ),
          // InkWell(
          //   child: Container(
          //     height: 100,
          //     width: 345,
          //     //color: Colors.red,
          //     decoration: BoxDecoration(
          //       // ignore: prefer_const_literals_to_create_immutables
          //       borderRadius: BorderRadius.circular(10),
          //       //color: Color.fromARGB(255, 92, 155, 164),
          //       color: Colors.white,
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.black.withOpacity(0.12),
          //           blurRadius: 5.0,
          //           spreadRadius: 1.1,
          //         ),
          //       ],
          //     ),
          //     child: Row(
          //       children: [
          //         Container(
          //           width: 200,
          //           //color: Colors.black,
          //           child: Column(
          //             children: [
          //               Container(
          //                 padding: const EdgeInsets.only(left: 10.0),
          //                 height: 50,
          //                 width: 290,
          //                 alignment: Alignment.centerLeft,
          //                 //color: Colors.white,
          //                 child: Text(
          //                   'LEGS',
          //                   textAlign: TextAlign.left,
          //                   style: TextStyle(
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 20,
          //                       color: Colors.black),
          //                 ),
          //               ),
          //               Container(
          //                 padding: const EdgeInsets.only(left: 10.0),
          //                 height: 50,
          //                 width: 290,
          //                 //color: Colors.red,
          //                 child: Text(
          //                   '20 EXERCISES',
          //                   textAlign: TextAlign.left,
          //                   style: TextStyle(
          //                       fontWeight: FontWeight.w900,
          //                       fontSize: 18,
          //                       color: Colors.grey),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //         Container(
          //           padding: const EdgeInsets.only(top: 0.0),
          //           alignment: Alignment.topLeft,
          //           //color: Colors.red,
          //           // height: 300,
          //           // width: 80,
          //           child: Image.asset(
          //             'assets/images/climb.png',
          //             width: 100,
          //             height: 100,
          //           ),
          //         ),
          //         Container(
          //           padding: const EdgeInsets.only(left: 5.0),
          //           width: 45,
          //           //color: Colors.orange,
          //           child: InkWell(
          //             child: Icon(
          //               Icons.arrow_circle_right,
          //               color: Colors.pinkAccent,
          //               size: 30,
          //             ),
          //             onTap: () {
          //               //action code when clicked
          //               print("The icon is clicked");
          //             },
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          //   onTap: (() {}),
          // ),
      
      
      
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
