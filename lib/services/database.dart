

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
final  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // collection reference
  addUsers(String docId,String email)async{
    await _firestore.collection("users").doc(docId).set({
      'email':email,
    }).then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
  }

addFeedback(String email ,String last_name,String feedback,String first_name,bool vote)async{
  await _firestore.collection("feedback").add({
    'email':email,
    "first_name":first_name,
    "last_name":last_name,
    "feedback":feedback,
    "vote":vote

  }).then((value) => print("feedback added"))
      .catchError((error) => print("Failed to add user: $error"));
}
addVolunteers(String email, String first_name,String last_name,String county,String ward,String dropdownValue)async{
  await _firestore.collection("volunteers").add({
    'email':email,
    "first_name":first_name,
    "last_name":last_name,
    "county":county,
    "ward":ward,
    "role":dropdownValue
  }).then((value) => print("feedback added"))
      .catchError((error) => print("Failed to add user: $error"));
}
    // get brews stream
  Stream<QuerySnapshot> get users {
    return _firestore.collection("users").snapshots();
  }
  Stream<QuerySnapshot> get gallery {
    return _firestore.collection("gallery").snapshots();
  }


}