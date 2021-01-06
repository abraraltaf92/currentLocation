import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ooptech/services/auth.dart';
import 'package:ooptech/screens/wrapper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          title: 'OopTech',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.white,
            accentColor: Colors.blueGrey,
          ),
          home: AnimatedSplashScreen(
            splash: Image.asset(
              'assets/images/logo.png',
            ),
            nextScreen: Wrapper(),
            splashTransition: SplashTransition.sizeTransition,
            backgroundColor: Colors.blueGrey,
          ),
        ));
  }
}
