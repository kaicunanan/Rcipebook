import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

import '../firestoreCRUD.dart';

class MySmoothie extends StatefulWidget {
  const MySmoothie({super.key});

  @override
  State<MySmoothie> createState() => _MySmoothieState();
}

class _MySmoothieState extends State<MySmoothie> {
  // List of recipes with image paths and names
  final List<Map<String, String>> recipes = [
    {'image': 'smothie/Apple-Smoothie.jpg', 'name': "Apple Smoothie"},
    {'image': 'smothie/banana-smoothie.jpg', 'name': "Banana Smoothie"},
    {'image': 'smothie/Beet-Smoothie.jpg', 'name': "Beet Smoothie"},
    {'image': 'smothie/buff smoothie.jpg', 'name': "Buff Smoothie"},
    {'image': 'smothie/carrot-smoothie.jpg', 'name': "Carrot Smoothie"},
    {'image': 'smothie/cocoa almond protein smoothie.jpg', 'name': "Cocoa Almond \nProtein Smoothie"},
    {'image': 'smothie/Honeydew-Smoothie.jpg', 'name': "Honeydew Smoothie"},
    {'image': 'smothie/Kale-Pineapple-Smoothie.jpg', 'name': "Kale Pineapple Smoothie"},
    {'image': 'smothie/Lemon Smoothie.png', 'name': "Lemon Smoothie"},
    {'image': 'smothie/loaded-coffee-smoothie.jpg', 'name': "Loaded Coffee Smoothie"},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFE1C4B3), // Main background color
        appBar: AppBar(
          title: const Text(
            "SMOOTHIE RECIPES",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          backgroundColor: const Color(0xFFCD8868), // AppBar background color
          iconTheme: const IconThemeData(
            color: Colors.white, // Icon color in AppBar
          ),
          leading: IconButton(  // Replacing the menu icon with an arrow icon
            icon: const Icon(Icons.arrow_back),  // Arrow icon
            onPressed: () {
              Navigator.pop(context);  // Navigates back to the previous screen
            },
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipOval(
                // Circular logo in the AppBar
                child: Image.asset(
                  'images/logoapp.png',
                  fit: BoxFit.cover,
                  width: 40,
                  height: 55,
                ),
              ),
            ),
          ],
        ),

        drawer: Drawer(
          child: Container(
            color: const Color(0xFFE1C4B3), // Drawer background color
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xFFCD8868), // Drawer header background
                  ),
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home, color: Colors.white),
                  title: const Text(
                    'HOME',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context); // Close drawer on tap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.favorite, color: Colors.pink),
                  title: const Text(
                    'FAVORITE',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context); // Close drawer on tap
                  },
                ),
              ],
            ),
          ),
        ),


        body: Container(
          color: const Color(0xFFE1C4B3), // Main body background color
          child: GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of items per row
              crossAxisSpacing: 10, // Space between columns
              mainAxisSpacing: 10, // Space between rows
              childAspectRatio: 0.8, // Width-to-height ratio
            ),
            itemCount: recipes.length, // Total number of items
            itemBuilder: (context, index) {
              // Passing data to `Repeat` widget for each grid item
              return Repeat(
                imagesStr: recipes[index]['image']!,
                name: recipes[index]['name']!,
              );
            },
          ),
        ),
      ),
    );
  }
}

// Custom widget for each recipe card
class Repeat extends StatefulWidget {
  final String imagesStr; // Path to the image
  final String name; // Recipe name

  const Repeat({
    super.key,
    required this.imagesStr,
    required this.name,
  });

  @override
  State<Repeat> createState() => _RepeatState();
}

class _RepeatState extends State<Repeat> {
  final FirestoreService firestoreService = FirestoreService();

  void showAlertDialog(
      {required BuildContext context,
        String? message,
        AnimatedSnackBarType? asb}) {
    AnimatedSnackBar.material(
      message!,
      type: asb!,
    ).show(context);
  }

  bool isFavorite = false;
  String docuId = "";


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFCD8868), // Card background color
        borderRadius: BorderRadius.circular(15.0), // Rounded corners
      ),
      padding: const EdgeInsets.all(8.0), // Reduced padding
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0), // Image rounded corners
            child: Image.asset(
              widget.imagesStr,
              width: 150.0, // Reduced width
              height: 150.0, // Reduced height
              fit: BoxFit.cover, // Scales image proportionally
            ),
          ),
          const SizedBox(height: 8), // Reduced spacer
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between text and icon
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                // Ensures the text does not overflow
                child: Text(
                  widget.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11, // Reduced font size
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              IconButton(
                onPressed: () async {
                  if (isFavorite) {
                    try {

                      // We already have the docId stored from the previous add operation.
                      if (docuId.isNotEmpty) {
                        // Delete the document using the stored docId
                        await firestoreService.deleteNote(docuId);

                        // Update the state to reflect the removal of the recipe from favorites
                        setState(() {
                          isFavorite = false; // Mark as not favorite
                          docuId = ""; // Clear the docId after deletion
                        });

                        showAlertDialog(
                          context: context,
                          message: 'Recipe deleted from favorites',
                          asb: AnimatedSnackBarType.error,
                        );
                      } else {
                        showAlertDialog(
                          context: context,
                          message: 'No matching document found for deletion',
                          asb: AnimatedSnackBarType.error,
                        );
                      }
                    } catch (e) {
                      print('Error deleting recipe: $e');
                      showAlertDialog(
                        context: context,
                        message: 'Error occurred while deleting',
                        asb: AnimatedSnackBarType.error,
                      );
                    }
                  } else {
                    try {
                      // Add the recipe to Firestore
                      final docRef = await firestoreService.addNote(
                        name: widget.name,
                        image: widget.imagesStr,
                      );

                      // Store the document ID for future reference
                      setState(() {
                        isFavorite = true;
                        docuId = docRef.id; // Save the docId when added
                      });

                      showAlertDialog(
                        context: context,
                        message: 'Recipe added to favorites',
                        asb: AnimatedSnackBarType.success,
                      );
                    } catch (e) {
                      print('Error adding recipe: $e');
                      showAlertDialog(
                        context: context,
                        message: 'Error occurred while adding to favorites',
                        asb: AnimatedSnackBarType.error,
                      );
                    }
                  }
                },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.heart_broken,  // Switch icons based on isFavorite state
                  color: isFavorite ? Colors.red : null,  // Red color for favorite
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
