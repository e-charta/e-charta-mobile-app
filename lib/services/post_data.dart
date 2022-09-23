import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';

class PostData {
  Future<void> createUser() async {
    print('tapped');
    final docUser =
        FirebaseFirestore.instance.collection('users').doc('user-id');
    final json = {
      'name': 'Ajong',
      'age': 19,
      'birthday': DateTime(2002, 03, 11),
    };
    await docUser.set(json);
  }
}
