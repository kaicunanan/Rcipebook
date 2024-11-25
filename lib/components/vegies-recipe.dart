import 'package:flutter/material.dart';

class MyVegies extends StatefulWidget {
  const MyVegies({super.key});

  @override
  State<MyVegies> createState() => _MyVegiesState();
}

class _MyVegiesState extends State<MyVegies> {
  // List of recipes with image paths and names
  final List<Map<String, String>> recipes = [
    {'image': 'vegies/barleyrisotto.jpg', 'name': "Barleyrisotto"},
    {'image': 'vegies/Cauliflower Fried Rice.png', 'name': "Cauliflower Fried Rice"},
    {'image': 'vegies/chapsuey.jpg', 'name': "Chapsuey"},
    {'image': 'vegies/cheesy-stuffed-peppers-with-white-beans.jpg', 'name': "Cheesy Stuffed Peppers \nwith White Beans"},
    {'image': 'vegies/Fusilli with Brocoli Presto.png', 'name': "Fusilli with Brocoli Presto"},
    {'image': 'vegies/pinakbet.jpg', 'name': "pinakbet.jpg"},
    {'image': 'vegies/quick-chickpea-and-kale-stew.jpg', 'name': "Quick Chickpea \nand Kale Stew"},
    {'image': 'vegies/Spiced-Carrot-Fritters.jpg', 'name': "Spiced Carrot Fritters"},
    {'image': 'vegies/spinach-presto-pasta.jpg', 'name': "Spinach Presto Pasta"},
    {'image': 'vegies/squash-toast.jpg', 'name': "Squash Toast"},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFE1C4B3), // Main background color
        appBar: AppBar(
          title: const Text(
            "VEGETABLES RECIPES",
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
  bool isFavorite = false; // Tracks whether the recipe is favorited

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
              GestureDetector(
                // Makes the favorite icon clickable
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite; // Toggles favorite state
                  });
                  print('${widget.name} favorite toggled: $isFavorite'); // Debugging message
                },
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border, // Dynamic icon
                  size: 24, // Reduced icon size
                  color: isFavorite ? Colors.red : Colors.white, // Color based on state
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
