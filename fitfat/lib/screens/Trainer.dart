// ignore_for_file: prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitfat/models/auth.dart';
import 'package:fitfat/screens/AddTrainers.dart';
import 'package:fitfat/screens/childpose.dart';
import 'package:fitfat/screens/dietplan.dart';
import 'package:fitfat/screens/widget/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class TrainersSection extends StatefulWidget {
  TrainersSection();

  @override
  State<TrainersSection> createState() => _DietUsersState();
}

final AuthService _auth = new AuthService();
final Stream<QuerySnapshot> studentsStream =
      FirebaseFirestore.instance.collection('Trainers').snapshots();

int _selectedIndex = 0;
String Email = '';
String Kilometers = '';
String Steps = '';
String Minutes = '';
String yogadet = '';

class _DietUsersState extends State<TrainersSection> {
  final AuthService _auth = new AuthService();

  final CollectionReference _Diet =
      FirebaseFirestore.instance.collection('Trainers');

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  getCurrentDate() {
    var date = DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

    return formattedDate;
  }

  Future refresh() async {}
  String name = '';
  String Description = '';
  String ZoomLink = '';
  String Email = '';

  void _getdata() async {
    FirebaseFirestore.instance
        .collection('DietPlan')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .snapshots()
        .listen((userData) {
      setState(() {
        String Email = userData.data()!['Email'];
        name = userData.data()!['Name'];
        Description = userData.data()!['Description'];
        Email = userData.data()!['Email'];
      });
    });
  }

  void MyTrainer() async {
    //     .collection('classes')
    //     .get()
    //     .then((QuerySnapshot querySnapshot) {
    //   querySnapshot.docs.forEach((doc) {
    //     print(doc.data());
    //   });
    // });
    // do any further processing as you want
  }
  // Get data from docs and convert map to List
  // final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

  // print(allData);
//}
//     QuerySnapshot snap = await
//     FirebaseFirestore.instance.collection('Trainers').get();

// snap.docs.forEach((document) {
//     print(document.id);
//   });

  @override
  void initState() {
    super.initState();
    MyTrainer();
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
                    'Trainer Section',
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
            height: 150.0,
            width: 150.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/U_58_19820213168_tumblr_mr2tleNhPZ1qhu3vxo5_5001.gif'),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              children: [
                Container(
                  child: Text(
                    'Trainer Info',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                StreamBuilder<QuerySnapshot>(
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

                      final List storedocs = [];
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map a = document.data() as Map<String, dynamic>;
                        storedocs.add(a);
                        a['id'] = document.id;
                      }).toList();

                      return Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 0.0, vertical: 0.0),
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
                                          'Name',
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
                                          child: Text(storedocs[i]['Name'],
                                              style:
                                                  TextStyle(fontSize: 18.0))),
                                    ),
                                    TableCell(
                                      child: Center(
                                          child: Text(storedocs[i]['Email'],
                                              style:
                                                  TextStyle(fontSize: 18.0))),
                                    ),
                                  ],
                                ),
                              ],
                            ],
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
          
          SizedBox(height: 10,),
          Container(
            child: ElevatedButton(
              onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddTrainers()));},
              child: Text('ADD NEW'),
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
                        name,
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
                            Email,
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
                            ZoomLink,
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
