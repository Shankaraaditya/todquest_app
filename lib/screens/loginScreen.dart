import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todquest_active_user_app_flutter/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todquest_active_user_app_flutter/screens/UI_screen.dart';
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

  // ==============================================================================================================================================================================================================
  Future<List<UserDetails>> fetchAllUserDetails() async {
    List<UserDetails> userDetailsList = [];

    try {
      final QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('users').get();

      final List<QueryDocumentSnapshot> documents = querySnapshot.docs;

      for (final document in documents) {
        final userDetails = UserDetails.fromSnapshot(document);
        userDetailsList.add(userDetails);
      }
    } catch (e) {
      print('Error: $e');
    }

    return userDetailsList;
  }

  void getUserDetails(List<UserDetails> s) async {
    List<UserDetails> s = await fetchAllUserDetails();
    print(s[0].comeFrom);
  }

  List<UserDetails> activeUsers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title:  Text("Login Screen" ,style: GoogleFonts.poppins( fontSize: 30 ,fontWeight: FontWeight.bold),),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text("Password"),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              CupertinoButton(
                onPressed: () {
                  signUp(_emailController.text, _passController.text);
                },
                child: const Text("Login"),
              ),
              
              CupertinoButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => const ActiveUsers(),
                    ),
                  );
                },
                child: const Text("Active Users"),
              ),

                CupertinoButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => const UiTaskScreen(),
                    ),
                  );
                },
                child: const Text("UI Task"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
