import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/user.dart';

class ActiveUsers extends StatefulWidget {
  const ActiveUsers({super.key});


  @override
  State<ActiveUsers> createState() {
    return _ActiveUsers();
  }
}

class _ActiveUsers extends State<ActiveUsers> {
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

  void fetchAndDisplayUserDetails() async {
    List<UserDetails> userDetailsList = await fetchAllUserDetails();

    for (final userDetails in userDetailsList) {
      print('User ID: ${userDetails.userId}');
      print('Email: ${userDetails.name}');
      print('Display Name: ${userDetails.comeFrom}');
      print('--------------------');
    }
  }

// =======================================================================================================

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.lightBlue,
      child: ElevatedButton(
        onPressed: () {
          fetchAndDisplayUserDetails();
        },
        child: const Text("fetch"),
      ),
    );
  }
}
