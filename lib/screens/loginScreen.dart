import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todquest_active_user_app_flutter/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todquest_active_user_app_flutter/screens/users.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  var _selected = "";

// =======================================================================================================================
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signUp(String email, String password) async {
    await Firebase.initializeApp();
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Handle successful sign-up
      User? user = userCredential.user;
      if (user != null) {
        // User signed up successfully
        print("signup successful");
        addUserDetails(
            _nameController.text, _emailController.text, _selected.toString());
      } else {
        // Error occurred during sign-up
      }
    } catch (e) {
      // Handle sign-up errors
      print('Sign-up Error: $e');
    }
  }

  // =======================================================================================================================

  Future addUserDetails(String name, String emailID, String comeFrom) async {
    await FirebaseFirestore.instance
        .collection("users")
        .add({'name': name, 'email': emailID, 'comeFrom': comeFrom});
    print("Details added");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        label: Text("Name"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                      items: [
                        for (final category in ComeFrom.values)
                          DropdownMenuItem(
                            value: category.name,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: Colors.pink,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(category.name)
                              ],
                            ),
                          )
                      ],
                      onSaved: (value) {
                        print("ON SAVED -->>> $value");
                      },
                      onChanged: (value) {
                        _selected = value!;
                        print(_selected);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  label: Text("Email"),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _passController,
                decoration: const InputDecoration(
                  label: Text("Password"),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  signUp(_emailController.text, _passController.text);
                },
                child: const Text("Login"),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => const ActiveUsers(),
                    ),
                  );
                },
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
