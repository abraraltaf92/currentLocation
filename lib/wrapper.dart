import 'package:firebase_auth/firebase_auth.dart';
import 'package:ooptech/authenticate.dart';
import 'package:ooptech/home.dart';
import 'package:ooptech/user.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}