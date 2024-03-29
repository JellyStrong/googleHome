import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseConnection extends StatefulWidget {
  const FirebaseConnection({super.key});

  @override
  State<FirebaseConnection> createState() => _FirebaseConnectionState();
}

class _FirebaseConnectionState extends State<FirebaseConnection> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    //자동생성
    _firestore.collection("collectionId").add({});

    //수동생성
    _firestore.collection("collectionId").doc("documentId").set({});
    return const Placeholder();
  }
}
