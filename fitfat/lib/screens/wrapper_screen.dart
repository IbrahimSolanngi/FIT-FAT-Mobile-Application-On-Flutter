import 'package:fitfat/screens/handler_screen.dart';
import 'package:fitfat/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../models/FirebaseUser.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser?>(context);

    if (user == null) {
      return Handler();
    } else {
      return Home();
    }
  }
}
