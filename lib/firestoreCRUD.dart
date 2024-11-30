import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference favorite =
  FirebaseFirestore.instance.collection('favorite');

  // Create (add note)
  Future<DocumentReference> addNote({required String name, required String image}) async {
    try {
      DocumentReference docRef = await favorite.add({
        'recipe-name': name,
        'timestamp': Timestamp.now(),
        'image': image,
      });
      return docRef; // Return the document reference
    } catch (e) {
      print('Error adding note: $e');
      rethrow; // Rethrow the error for further handling
    }
  }

  // Read
  Stream<QuerySnapshot> getNotesStream() {
    return favorite.orderBy('timestamp', descending: true).snapshots();
  }

  // Update
  Future<void> editNote(String docID, String newNote) {
    return favorite.doc(docID).update({
      'note': newNote,
      'timestamp': Timestamp.now(),
    });
  }

  // Delete (delete note using document ID)
  Future<void> deleteNote(String docID) {
    return favorite.doc(docID).delete();
  }
}
