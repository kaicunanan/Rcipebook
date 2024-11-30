import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteButton extends StatelessWidget {
  final String userId;
  final String itemId;

  FavoriteButton({required this.userId, required this.itemId});

  Future<void> addToFavorites() async {
    try {
      await FirebaseFirestore.instance
          .collection('favorites')
          .doc('$userId$itemId')
          .set({
        'userId': userId,
        'itemId': itemId,
        'timestamp': FieldValue.serverTimestamp(),
      });
      print('Added to Favorites');
    } catch (e) {
      print('Error adding to Favorites: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: addToFavorites,
      child: Text('Add to Favorites'),
    );
  }
}
