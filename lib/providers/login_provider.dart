import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> logout(context) async {
  await FirebaseAuth.instance.signOut();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text("Wylogowano!"),
  ));
}
