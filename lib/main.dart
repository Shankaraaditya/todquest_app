import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todquest_active_user_app_flutter/screens/loginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      home: await LoginScreen(),
    ),
  );
}
