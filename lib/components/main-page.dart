import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/components/bake-recipes.dart';
import 'package:cookbook/components/bread-recipe.dart';
import 'package:cookbook/components/chicken-recipe.dart';
import 'package:cookbook/components/egg-recipes.dart';
import 'package:cookbook/components/fruit-recipe.dart';
import 'package:cookbook/components/kids-recipe.dart';
import 'package:cookbook/components/pork-recipe.dart';
import 'package:cookbook/components/salad-recipe.dart';
import 'package:cookbook/components/seafood-recipe.dart';
import 'package:cookbook/components/smothie-recipe.dart';
import 'package:cookbook/components/soup-recipe.dart';
import 'package:cookbook/components/vegies-recipe.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecipesPage(),
    );
  }
}

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});
  @override
  _RecipesPageState createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  final user = FirebaseAuth.instance.currentUser!;
  Future<void>logoutFunction()async{
    FirebaseAuth.instance.signOut();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE1C4B3),
      appBar: AppBar(
        title: const Text(
          "RECIPES BOOK",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Poppins",
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ), // White AppBar text
        ),
        backgroundColor: Color(0xFFCD8868), // AppBar color
        iconTheme: const IconThemeData(
          color: Colors.white, // White burger icon
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
              child: Image.asset(
                'images/logoapp.png', // Path to your logo file
                fit: BoxFit.cover,
                width: 40,
                height: 55, // Adjust height as necessary
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Color(0xFFE1C4B3), // Background color for the menu body
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                curve: Curves.bounceIn,
                decoration: BoxDecoration(
                  color: Color(0xFFCD8868), // Header color
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white, // White text for the Drawer header
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading:
                    const Icon(Icons.home, color: Colors.white), // White icon
                title: const Text(
                  'HOME',
                  style: TextStyle(color: Colors.white), // White text
                ),
                onTap: () {
                  Navigator.pop(context); // Close the drawer when tapped
                },
              ),
              ListTile(
                leading: const Icon(Icons.favorite, color: Colors.pink), // Pink icon
                title: const Text(
                  'FAVORITE',
                  style: TextStyle(color: Colors.white), // White text
                ),
                onTap: () {
                  Navigator.pop(context); // Close the drawer when tapped
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.green,),
                title: const Text("Logout"),
                titleTextStyle: const TextStyle(
                  color: Colors.black,
                  fontFamily: "Poppins",
                ),
                onTap: (){
                    logoutFunction();

                },
              ),
            ],
          ),
        ),
      ),


      body: Container(
        // color: Color(0xFFE1C4B3), // Background color for the main body
        child: const SingleChildScrollView(
          // Enable scrolling
          child: Column(
            children: [
              SizedBox(height: 10), // Spacer
              // Repeat the rows of recipes here
              Row(
                children: [
                  Repeat(
                    imagesStr: 'RecipesPage/Chicken.jpg',
                    name: "Chicken",
                    recipe: "10 Recipes",
                    childWidget: MyChicken(),
                  ),
                  Repeat(
                    imagesStr: 'RecipesPage/pork.jpg',
                    name: "Pork",
                    recipe: "10 Recipes",
                    childWidget: MyPork(),
                  ),
                ],
              ),
              Row(
                children: [
                  Repeat(
                    imagesStr: 'RecipesPage/seafood.jpg',
                    name: "Seafood",
                    recipe: "10 Recipes",
                    childWidget: MySeafood(),
                  ),
                  Repeat(
                      imagesStr: 'RecipesPage/egg.jpg',
                      name: "Egg",
                      recipe: "10 Recipes",
                      childWidget: MyEgg()),
                ],
              ),
              Row(
                children: [
                  Repeat(
                    imagesStr: 'RecipesPage/vege.jpg',
                    name: "Vegetables",
                    recipe: "10 Recipes",
                    childWidget: MyVegies(),
                  ),
                  Repeat(
                    imagesStr: 'RecipesPage/salad.jpg',
                    name: "Salad",
                    recipe: "10 Recipes",
                    childWidget: MySalad(),
                  ),
                ],
              ),
              Row(
                children: [
                  Repeat(
                    imagesStr: 'RecipesPage/soup.jpg',
                    name: "Soup",
                    recipe: "10 Recipes",
                    childWidget: MySoup(),
                  ),
                  Repeat(
                    imagesStr: 'RecipesPage/kids.jpg',
                    name: "Kids",
                    recipe: "10 Recipes",
                    childWidget: MyKids(),
                  ),
                ],
              ),
              Row(
                children: [
                  Repeat(
                    imagesStr: 'RecipesPage/bread.jpg',
                    name: "Bread",
                    recipe: "10 Recipes",
                    childWidget: MyBread(),
                  ),
                  Repeat(
                    imagesStr: 'RecipesPage/fruit.jpg',
                    name: "Fruit",
                    recipe: "10 Recipes",
                    childWidget: MyFruit(),
                  ),
                ],
              ),
              Row(
                children: [
                  Repeat(
                    imagesStr: 'RecipesPage/bake.jpg',
                    name: "Bake",
                    recipe: "10 Recipes",
                    childWidget: MyBake(),
                  ),
                  Repeat(
                    imagesStr: 'RecipesPage/smoothie.jpg',
                    name: "Smoothie",
                    recipe: "10 Recipes",
                    childWidget: MySmoothie(),
                  ),
                ],
              ),
              // SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}

// Todo this is for the recipes function
class Repeat extends StatefulWidget {
  final String imagesStr;
  final String name;
  final String recipe;
  final Widget childWidget;
  const Repeat(
      {super.key,
      required this.imagesStr,
      required this.name,
      required this.recipe,
      required this.childWidget});

  @override
  State<Repeat> createState() => _RepeatState();
}

class _RepeatState extends State<Repeat> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ), // Spacer
        Center(
          child: Row(
            children: [
              const Padding(padding: EdgeInsets.all(10)),
              GestureDetector(
                onTap: () {
                  // Define what happens when the button is pressed
                  print('${widget.name} button tapped!');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => widget.childWidget));
                  // Navigate to another page or show details here
                },
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFFCD8868), // Container color
                    borderRadius:
                        BorderRadius.circular(20.0), // Rounded corners
                  ),
                  padding: const EdgeInsets.all(10.0),
                  alignment:
                      Alignment.center, // Align children inside the container
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Center image and text
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                            10.0), // Rounded corners for the image
                        child: Image.asset(
                          widget.imagesStr, // Image path
                          width: 130.0, // Adjust width of the image
                          height: 75.0, // Adjust height of the image
                          fit: BoxFit
                              .cover, // Scale the image to fit within the box
                        ),
                      ),
                      const SizedBox(
                          height: 10), // Spacer between image and text
                      Text(
                        widget.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                        ),
                      ),
                      const SizedBox(
                          height: 5), // Spacer between name and recipe
                      Text(
                        widget.recipe, // Text inside the container
                        style: const TextStyle(
                            color: Colors.white, fontSize: 10), // White text
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
