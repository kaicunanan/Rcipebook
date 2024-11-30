import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookbook/components/main-page.dart';
import 'package:flutter/material.dart';

import 'firestoreCRUD.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFE1C4B3),
        appBar: AppBarFav(),
        body: BodyFav(),
      ),
    );
  }
}

class AppBarFav extends StatefulWidget implements PreferredSizeWidget {
  const AppBarFav({super.key});

  @override
  State<AppBarFav> createState() => _AppBarFavState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarFavState extends State<AppBarFav> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const MainPage()));
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          )),
      title: const Text(
        "Favorite",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: const Color(0xFFCD8868),
    );
  }
}

Widget buildDynamicGrid(List<Map<String, String>> items) {
  return GridView.builder(
    padding: const EdgeInsets.all(10.0),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, // Two columns
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      childAspectRatio: 0.8, // Adjust as needed for your design
    ),
    itemCount: items.length,
    itemBuilder: (context, index) {
      final item = items[index];
      return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Expanded(
                child: Image.asset(
                  item['image']!,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                item['recipe-name']!,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    },
  );
}

class BodyFav extends StatefulWidget {
  const BodyFav({super.key});

  @override
  State<BodyFav> createState() => _BodyFavState();
}

final FirestoreService firestoreService = FirestoreService();

class _BodyFavState extends State<BodyFav> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestoreService.getNotesStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<DocumentSnapshot> noteslist = snapshot.data!.docs;

          // Map the documents to a list of items containing recipe names and images
          List<Map<String, String>> items = noteslist.map((document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            String recipeText = data['recipe-name'] ?? 'No Name';
            String recipeImg = data['image'] ?? 'assets/default_image.png'; // Add a default image if none exists

            return {
              'recipe-name': recipeText,
              'image': recipeImg,
            };
          }).toList();

          return buildDynamicGrid(items);
        } else if (snapshot.hasError) {
          return const Center(child: Text("Error loading data"));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

