import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

enum ComeFrom { Facebook, Google, Instagram, Organic, Friend }

class UserModel {
  UserModel({required this.name, required this.email ,required this.source});
  final String name;
  final StringProperty email;
  final ComeFrom source;
}


class UserDetails {
  final String userId;
  final String name;
  final String comeFrom;

  UserDetails({
    required this.userId,
    required this.name,
    required this.comeFrom,
  });

  factory UserDetails.fromSnapshot(QueryDocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return UserDetails(
      userId: snapshot.id,
      name: data['name'] ?? '',
      comeFrom: data['comeFrom'] ?? '',
    );
  }
}
