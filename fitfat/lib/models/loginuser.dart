import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:provider/provider.dart';

class LoginUser {
  final String? email;
  final String? password;

  LoginUser({this.email, this.password});
}
