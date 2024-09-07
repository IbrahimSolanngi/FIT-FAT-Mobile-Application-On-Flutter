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

class TrainersSection2 extends StatefulWidget {
  TrainersSection2();

  @override
  State<TrainersSection2> createState() => _DietUsersState();
}

class _DietUsersState extends State<TrainersSection2> {
  final AuthService _auth = new AuthService();
  

  String BreakFast = '';
  String Lunch = '';
  String Dinner = '';
  String Error = '';

  final _Breakfastinp = TextEditingController();
  final CollectionReference _Diet =
      FirebaseFirestore.instance.collection('DietPlan');

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  getCurrentDate() {
    var date = DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

    return formattedDate;
  }
  Future<void> _view([DocumentSnapshot?documentSnapshot])async{
  if(documentSnapshot!=null){
    print('MK');
  }
}


  Future refresh() async {}

  void _getdata() async {
     FirebaseFirestore.instance
    .collection('classes')
    .get()
    .then((QuerySnapshot querySnapshot) {
  querySnapshot.docs.forEach((doc) {
    print(doc.data());
  });
});
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
    _getdata();
  }

  @override
  final CollectionReference _products =
      FirebaseFirestore.instance.collection('Trainers');
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
            child: Column(
              children: [
                Container(
                  child: Text(
                    'FIT FAT TRAINERS',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: ElevatedButton(onPressed: () { _getdata(); }, child: Text('MK'),),
          ),
          Container(),
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
       body: 
       StreamBuilder(
        stream: _products.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(documentSnapshot['Name']),
                    subtitle: Text(documentSnapshot['Email'].toString()),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          // IconButton(
                          //   icon: const Icon(Icons.remove_red_eye),
                          //   onPressed: (() => {
                          //     _view(documentSnapshot),
                          //   }),
                          // ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
  );}
}
