import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteList extends StatelessWidget {
  final String userId;

  FavoriteList({required this.userId});

  Stream<QuerySnapshot> getFavorites() {
    return FirebaseFirestore.instance
        .collection('favorites')
        .where('userId', isEqualTo: userId)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: getFavorites(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Text('No favorites yet.');
        }

        final favoriteDocs = snapshot.data!.docs;
        return ListView.builder(
          shrinkWrap: true,
          itemCount: favoriteDocs.length,
          itemBuilder: (context, index) {
            final data = favoriteDocs[index].data() as Map<String, dynamic>;
            return ListTile(
              title: Text(data['itemId'] ?? 'Unknown Item'),
            );
          },
        );
      },
    );
  }
}
