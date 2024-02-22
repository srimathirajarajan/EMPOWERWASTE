// ignore_for_file: prefer_const_constructors, unused_import, use_key_in_widget_constructors, duplicate_import, unused_element, unused_local_variable, non_constant_identifier_names, avoid_web_libraries_in_flutter, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:bootcamp/features/app/splash_screen/splash_screen.dart';
import 'package:bootcamp/features/user_auth/presentation/pages/home_page.dart';
import 'package:bootcamp/features/user_auth/presentation/pages/login_page.dart';
import 'package:bootcamp/features/user_auth/presentation/pages/name_page.dart';

import 'package:bootcamp/features/user_auth/presentation/pages/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? savedEmail = prefs.getString('email');
  String? savedPassword = prefs.getString('password');
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyCLgBWoGwhiXPYtWK5mtkI10Jowz0VKSWs",
        appId: "1:710285524786:web:4e4e66d2e5b344299fe12b",
        messagingSenderId: "710285524786",
        projectId: "bootcamp-2a638",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(ProviderScope(child: MyApp(savedEmail, savedPassword)));
}

class MyApp extends StatelessWidget {
  final String? savedEmail;
  final String? savedPassword;

  MyApp(this.savedEmail, this.savedPassword);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health Lens',
      home: SplashScreen(
        child: savedEmail != null && savedPassword != null
            ? AutoLoginScreen(savedEmail, savedPassword)
            : LoginPage(),
      ),
      routes: {
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
        '/name': (context) => NamePage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 99, 20, 235),
          background: Color.fromARGB(255, 238, 236, 239),
        ),
        useMaterial3: true,
      ),
    );
  }
}

class AutoLoginScreen extends StatelessWidget {
  final String? email;
  final String? password;

  AutoLoginScreen(this.email, this.password);

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
