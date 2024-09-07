// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitfat/models/Auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/loginuser.dart';

class Register extends StatefulWidget {
  final Function? toggleView;
  Register({this.toggleView});

  @override
  State<StatefulWidget> createState() {
    return _Register();
  }
}

class _Register extends State<Register> {
  final AuthService _auth = AuthService();

  bool _obscureText = true;
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _user = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final userfield = TextFormField(
        controller: _user,
        autofocus: false,
        inputFormatters: <TextInputFormatter>[
          //FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
          //FilteringTextInputFormatter.allow(RegExp("^[\u0000-\u007F]+\$")),
          FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
        ],
        // validator: (value) {
        //   if (value != null) {
        //     if (value.contains('@') && value.endsWith('.com')) {
        //       return null;
        //     }
        //     return 'Enter a Valid Username';
        //   }
        // },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person_add_alt_1_outlined),
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

    final emailField = TextFormField(
        controller: _email,
        autofocus: false,
        validator: (value) {
          if (value != null) {
            if (value.contains('@') && value.endsWith('.com')) {
              return null;
            }
            return 'Enter a Valid Email Address';
          }
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.email_outlined),
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          hintStyle: (TextStyle(color: Colors.grey)),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.cyan),
          ),
        ));

    final passwordField = TextFormField(
        obscureText: _obscureText,
        controller: _password,
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
          prefixIcon: Icon(Icons.lock_outline),
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          hintStyle: (TextStyle(color: Colors.grey)),
          suffixIcon: IconButton(
            icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.cyan),
          ),
        ));

    final txtbutton = TextButton(
        onPressed: () {
          widget.toggleView!();
        },
        child: const Text(
          'Already have account? Login',
          style: TextStyle(color: Colors.black),
        ));
    final agreetext = TextButton(
        onPressed: () {
          widget.toggleView!();
        },
        child: const Text(
          'By Clicking Sign Up you agree to our Terms Of Use and Privacy Policy',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.grey,
            fontSize: 11,
          ),
          textAlign: TextAlign.center,
        ));
    final registerButton = Material(
        //elevation: 5.0,
        //borderRadius: BorderRadius.circular(30.0),
        //color: Theme.of(context).primaryColor,
        child: MaterialButton(
      minWidth: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          dynamic result = await _auth.registerEmailPassword(
              LoginUser(email: _email.text, password: _password.text));
          Map<String, String> datatosave = {
            'email': _email.text,
            'password': _password.text
          };

          FirebaseFirestore.instance.collection('User').add(datatosave);

          //await result.user?.updateDisplayName(_user);

          if (result.uid == null) {
            //null means unsuccessfull authentication
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text(result.code),
                  );
                });
          }
        }
      },
      child: Container(
        height: 40,
        padding: EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 6.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.orangeAccent, Colors.pinkAccent]),
            borderRadius: BorderRadius.circular(25.0)),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'SIGN UP',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    ));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'SIGN UP HERE',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              fontSize: 18),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              widget.toggleView!();
            },
            child: Text(
              'Login',
              style: TextStyle(color: Colors.pink, fontSize: 15),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            autovalidateMode: AutovalidateMode.always,
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //const SizedBox(height: 45.0),
                  userfield,
                  const SizedBox(height: 25.0),
                  emailField,
                  const SizedBox(height: 25.0),
                  passwordField,
                  const SizedBox(height: 25.0),
                  registerButton,
                  agreetext,
                  const SizedBox(height: 145.0),
                  txtbutton,
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
