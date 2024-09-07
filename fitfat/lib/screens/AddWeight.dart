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
import 'package:flutter/services.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class AddWeight extends StatelessWidget {
  AddWeight();

  final _getweight = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final gap=Material(
      child: Column(
        children: [
      SizedBox(height: 300,),
          Container(),
        ],
      ),
    );
    final image=Material(
      child: Image.asset(
                'assets/images/Lovepik_com-401552168-gym-exercise.gif',
              ),
    );
    final gap2=Material(
      child: Column(
        children: [
      SizedBox(height: 30,),
          Container(),
        ],
      ),
    );
    final AddWeight = TextFormField(
      inputFormatters: [
    FilteringTextInputFormatter.deny(RegExp(r'[/\\]')),
  ],
        controller: _getweight,
        autofocus: false,
        validator: (value) {
          
        },
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.add),
          // prefixIcon: Padding(
          //     padding: EdgeInsets.only(right: 10),
          //     child: const Icon(
          //       Icons.email,
          //       size: 15,
          //     ))));
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Add Weight", hintStyle: (TextStyle(color: Colors.grey)),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.cyan),
          ),
        ));
        final gap3=Material(
      child: Column(
        children: [
      SizedBox(height: 10,),
          Container(),
        ],
      ),
    );
final AddButton=Material(
  child: Container(child: ElevatedButton(onPressed: () async {

CollectionReference users =
          FirebaseFirestore.instance.collection('Weight');
      // Call the user's CollectionReference to add a new user
      await users.doc(FirebaseAuth.instance.currentUser!.email).set({
        'Weight': _getweight.text,
      });
      print('Text Added');

  },child: Text('CLECK TO PROCEED'),) ,)
);
    return Scaffold(

      body: SingleChildScrollView(
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
                  gap,
                  image,
                  gap2,
                  AddWeight,
                  gap3,
                  AddButton,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
