// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todquest_active_user_app_flutter/widget/user_detaill.dart';

import '../model/user.dart';

class ActiveUsers extends StatefulWidget {
  const ActiveUsers({super.key});

  @override
  State<ActiveUsers> createState() {
    return _ActiveUsers();
  }
}

class _ActiveUsers extends State<ActiveUsers> {
  List<UserDetails> userDetailsList = [];
  List<UserDetails> filteredUsers = [];
// ==============================================================================================================================================================================================================
  Future<List<UserDetails>> fetchAllUserDetails() async {
    List<UserDetails> userList = [];

    try {
      final QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('users').get();

      final List<QueryDocumentSnapshot> documents = querySnapshot.docs;

      for (final document in documents) {
        final userDetails = UserDetails.fromSnapshot(document);
        userList.add(userDetails);
      }
    } catch (e) {
      print('Error: $e');
    }

    // convert();

    return userList;
  }

// =======================================================================================================

  void _runFilter(
    String enteredKeyword,
  ) {
    List<UserDetails> results = [];
    if (enteredKeyword.isEmpty) {
      results = userDetailsList;
    } else {
      results = userDetailsList
          .where((element) =>
              element.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();

      // print(object)
    }

    print(results);
    setState(() {
      filteredUsers = results;
    });
  }

  void dropDownFilter(String selected) {
    List<UserDetails> results = [];
    if (selected.isEmpty) {
      results = userDetailsList;
    } else {
      results = userDetailsList
          .where((element) =>
              element.comeFrom.toLowerCase().contains(selected.toLowerCase()))
          .toList();

      // print(object)
    }

    print(results);
    setState(() {
      filteredUsers = results;
    });
  }

  @override
  void initState() {
    fetchAllUserDetails().then((value) {
      userDetailsList = value;
      filteredUsers = userDetailsList;
    });
    super.initState();
  }

  String? _selected;
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Active Users"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              controller: _searchController,
              decoration:
                  const InputDecoration(label: Text("Enter Name or email Id")),
              onChanged: (value) => _runFilter(
                _searchController.text,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
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
                dropDownFilter(value.toString());
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: fetchAllUserDetails().then((value) {
              // userDetailsList = value;
              // filteredUsers = userDetailsList;
            }),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                userDetailsList = filteredUsers;
                return const CircularProgressIndicator();
              } else {
                print("hereeeee");
                return Expanded(
                  child: ListView.builder(
                    itemCount: filteredUsers.length,
                    itemBuilder: (context, index) => AboutUser(
                      name: filteredUsers[index].name,
                      email: filteredUsers[index].email,
                      comeFrom: filteredUsers[index].comeFrom,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
