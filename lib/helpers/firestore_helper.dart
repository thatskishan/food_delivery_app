import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHelper {
  FirestoreHelper._();
  static final FirestoreHelper firestoreHelper = FirestoreHelper._();
  static final FirebaseFirestore db = FirebaseFirestore.instance;

//  Fetch Pizza Record

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchPizzaRecord() {
    return db.collection("pizza").snapshots();
  }
}
