// ignore_for_file: prefer_const_constructors

import 'package:fitfat/models/Auth.dart';
import 'package:fitfat/models/loginuser.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legacy_buttons/LegacyFlatButton.dart';

class Login extends StatefulWidget {
  final Function? toggleView;
  Login({this.toggleView});

  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

class _Login extends State<Login> {
  bool _obscureText = true;

  final _email = TextEditingController();
  final _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
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
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.email_outlined),
          // prefixIcon: Padding(
          //     padding: EdgeInsets.only(right: 10),
          //     child: const Icon(
          //       Icons.email,
          //       size: 15,
          //     ))));
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email", hintStyle: (TextStyle(color: Colors.grey)),
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
          'New? Register here',
          style: TextStyle(color: Colors.black),
        ));

    final orField = TextButton(
        onPressed: () {
          widget.toggleView!();
        },
        child: const Text(
          'Or login with your email',
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
        ));

    final loginAnonymousButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          dynamic result = await _auth.signInAnonymous();

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
        },
        // child: Text(
        //   "Log in Anonymously",
        //   style: TextStyle(color: Theme.of(context).primaryColorLight),
        //   textAlign: TextAlign.center,
        // ),
      ),
    );

    final googlebutton = Container(
      width: 400.0,
      child: FloatingActionButton.extended(
        label: Text('SIGN UP WITH GOOGLE'),
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
          Icons.mail,
          color: Colors.red,
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
    );
    final facebookbutton = Container(
      width: 400.0,
      child: FloatingActionButton.extended(
        label: Text('SIGN UP WITH FACEBOOK'),
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
          Icons.facebook,
          color: Colors.blue,
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
    );

    final loginEmailPasswordButon = Material(
        //elevation: 5.0,
        //borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
      minWidth: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          dynamic result = await _auth.signInEmailPassword(
              LoginUser(email: _email.text, password: _password.text));
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
            'LOGIN',
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
          'LOGIN HERE',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              fontSize: 18),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        //backgroundColor: Theme.of(context).primaryColor,
        // actions: <Widget>[
        //   TextButton(
        //     onPressed: () {
        //       widget.toggleView!();
        //     },
        //     child: Text(
        //       'Sign up',
        //       style: TextStyle(color: Colors.pink, fontSize: 15),
        //     ),
        //   ),
        // ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //loginAnonymousButon,
                  //const SizedBox(height: 280.0),
                  //const SizedBox(height: 25.0),
                  facebookbutton,
                  const SizedBox(height: 15.0),
                  googlebutton,
                  const SizedBox(height: 25.0),
                  orField,
                  emailField,
                  const SizedBox(height: 25.0),
                  passwordField,
                  const SizedBox(height: 35.0),
                  loginEmailPasswordButon,
                  const SizedBox(height: 15.0),
                  const SizedBox(height: 105.0),
                  txtbutton,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
