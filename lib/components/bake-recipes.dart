import 'package:flutter/material.dart';

// Main StatefulWidget for the Bake Recipes screen
class MyBake extends StatefulWidget {
  const MyBake({super.key});

  @override
  State<MyBake> createState() => _MyBakeState();
}

class _MyBakeState extends State<MyBake> {
  // List of recipes with image paths and names
  final List<Map<String, String>> recipes = [
    {'image': 'bake/baked-tomatoes-cheese.jpg', 'name': "Baked Tomatoes Cheese"},
    {'image': 'bake/cheeseburger-sliders.jpg', 'name': "Cheeseburger Sliders"},
    {'image': 'bake/chili-mac-casserole.jpg', 'name': "Chili Mac Casserole"},
    {'image': 'bake/CORNBREAD-TACO-BAKE.jpg', 'name': "CORNBREAD TACO BAKE"},
    {'image': 'bake/dump and bake raviolo casserole.jpg', 'name': "Dump and Bake \nRaviolo Casserole"},
    {'image': 'bake/easy mexican beeg mince bake.jpg', 'name': "Easy Mexican Beef \nMince Bake"},
    {'image': 'bake/enchilada casserole recipe.jpg', 'name': "Enchilada Casserole Recipe"},
    {'image': 'bake/fold over tortilla bake.jpg', 'name': "Fold Over \nTortilla Bake"},
    {'image': 'bake/Lasagna-Casserole.jpg', 'name': "Lasagna Casserole"},
    {'image': 'bake/Sweet-Potato-Pasta-Bake.jpg', 'name': "Sweet Potato \nPasta Bake"},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disables the debug banner
      home: Scaffold(
        backgroundColor: const Color(0xFFE1C4B3), // Sets the background color of the screen
        appBar: AppBar(
          title: const Text(
            "BAKE RECIPES",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          backgroundColor: const Color(0xFFCD8868), // Sets AppBar background color
          iconTheme: const IconThemeData(
            color: Colors.white, // Sets the color for AppBar icons
          ),
          leading: IconButton( // Custom back button
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Navigates back to the previous screen
            },
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipOval(
                // Displays a circular logo in the AppBar
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

        // Drawer for navigation menu
        drawer: Drawer(
          child: Container(
            color: const Color(0xFFE1C4B3), // Drawer background color
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xFFCD8868), // Drawer header background color
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
                  leading: const Icon(Icons.home, color: Colors.white), // Home icon
                  title: const Text(
                    'HOME',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context); // Closes drawer on tap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.favorite, color: Colors.pink), // Favorite icon
                  title: const Text(
                    'FAVORITE',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context); // Closes drawer on tap
                  },
                ),
              ],
            ),
          ),
        ),

        // Main body with a grid layout of recipes
        body: Container(
          color: const Color(0xFFE1C4B3), // Main body background color
          child: GridView.builder(
            padding: const EdgeInsets.all(10), // Padding around the grid
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of items per row
              crossAxisSpacing: 10, // Space between columns
              mainAxisSpacing: 10, // Space between rows
              childAspectRatio: 0.8, // Width-to-height ratio of grid items
            ),
            itemCount: recipes.length, // Total number of items
            itemBuilder: (context, index) {
              // Creates a custom widget for each grid item
              return Repeat(
                imagesStr: recipes[index]['image']!, // Path to the image
                name: recipes[index]['name']!, // Recipe name
              );
            },
          ),
        ),
      ),
    );
  }
}

// Custom widget representing each recipe card
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
  bool isFavorite = false; // Tracks whether the recipe is favorited

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFCD8868), // Card background color
        borderRadius: BorderRadius.circular(15.0), // Adds rounded corners
      ),
      padding: const EdgeInsets.all(8.0), // Padding inside the card
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0), // Rounds the image corners
            child: Image.asset(
              widget.imagesStr, // Displays the recipe image
              width: 150.0,
              height: 150.0,
              fit: BoxFit.cover, // Ensures the image scales proportionally
            ),
          ),
          const SizedBox(height: 8), // Spacer between image and text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Spacing between text and favorite icon
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  widget.name, // Displays the recipe name
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11, // Adjusted font size
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite; // Toggles the favorite state
                  });
                  print('${widget.name} favorite toggled: $isFavorite'); // Debug log
                },
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border, // Changes icon based on favorite state
                  size: 24,
                  color: isFavorite ? Colors.red : Colors.white, // Updates color dynamically
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}