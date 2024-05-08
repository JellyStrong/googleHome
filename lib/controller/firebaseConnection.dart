import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:googlehomepage/model/mainPage_model.dart';

// class FirebaseConnection extends StatefulWidget {
//   const FirebaseConnection({super.key});

//   @override
//   State<FirebaseConnection> createState() => _FirebaseConnectionState();
// }

// class _FirebaseConnectionState extends State<FirebaseConnection> {
//   @override
//   Widget build(BuildContext context) {
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     //자동생성
//     firestore.collection("guestBook").doc().set({
//       "content": "ㅇ아아",
//       "created_at": DateTime, //DATE FORMAT
//       "name": "ㅈㅈ",
//       "no": "2",
//       "password": "1234",
//       "updated_at": DateTime,
//     });

//     //수동생성
//     //_firestore.collection("collectionId").doc("documentId").set({});

//     return const Placeholder();
//   }
// }

// FirebaseFirestore _firestore = FirebaseFirestore.instance;
// await _firestore.collection("cars").doc().set(
//                 {
//                   "brand": "Genesis",
//                   "name": "G80",
//                   "price": 7000,
//                 },
//               );
// class FirebaseConnection{
//       FirebaseFirestore _firestore = FirebaseFirestore.instance;
//     //자동생성
//     _firestore.collection("guestBook").doc().set({
//       "content": "ㅇ아아",
//       "created_at": DateTime, //DATE FORMAT
//       "name": "ㅈㅈ",
//       "no": "2",
//       "password": "1234",
//       "updated_at": DateTime,
//     });
// }

class gusetBookController extends StatefulWidget {
  const gusetBookController({super.key});

  @override
  State<gusetBookController> createState() => _gusetBookController();
}

class _gusetBookController extends State<gusetBookController> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("guestBook").snapshots(),
      builder: ((context, snapshot) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {

          },
        );
      }),
    );
  }
}

final CollectionReference guestBook =
FirebaseFirestore.instance.collection('guestBook');

Stream<QuerySnapshot> getGuestBookStream() {
  return guestBook.snapshots();
    //guestBook.orderBy('date', descending: true).snapshots();
}
final List<GuestBook> _guestBook = [];
List<GuestBook> get _guestBookList => _guestBook;

final firestore = FirebaseFirestore.instance;

// getData() async {
//   var result = await firestore.collection('guestBook').doc('NKHhHh4KGRx01tC3wX57').get();
//   print(">>>>>>>>>>>>>");
//   print(result.data());
//   GuestBook(name: result.data.toString(), content: '', password: '');
// }