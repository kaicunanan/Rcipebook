import 'package:cloud_firestore/cloud_firestore.dart';


class FirestoreService {
  final CollectionReference favorite =
  FirebaseFirestore.instance.collection('favorite');

  //create

  Future<void> addNote({required String name, required String image}) {
    return favorite.add({
      'recipe-name': name,
      'timestamp': Timestamp.now(),
      'image': image,
    });
  }

  //read
  Stream<QuerySnapshot> getNotesStream() {
    final noteStream = favorite.orderBy('timestamp', descending: true).snapshots();
    return noteStream;
  }

  //update
  Future<void> editNote(String docID, String newNote) {
    return favorite.doc(docID).update({
      'note': newNote,
      'timestamp': Timestamp.now(),
    });
  }

  //delete

  Future<void> deleteNote(String docID) {
    return favorite.doc(docID).delete();
  }
}
