import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todquest_active_user_app_flutter/screens/loginScreen.dart';
import 'package:todquest_active_user_app_flutter/screens/UI_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      home:  LoginScreen(),
      theme: ThemeData(brightness: Brightness.dark)
      // home: UiTaskScreen(),
    ),
  );
}
