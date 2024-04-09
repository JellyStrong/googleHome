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
    _firestore.collection("guestBook").doc().set({
      "content": "ㅇ아아",
      "created_at": DateTime, //DATE FORMAT
      "name": "ㅈㅈ",
      "no": "2",
      "password": "1234",
      "updated_at": DateTime,
    });

    //수동생성
    //_firestore.collection("collectionId").doc("documentId").set({});

    return const Placeholder();
  }
}

// FirebaseFirestore _firestore = FirebaseFirestore.instance;
// await _firestore.collection("cars").doc().set(
//                 {
//                   "brand": "Genesis",
//                   "name": "G80",
//                   "price": 7000,
//                 },
//               );
