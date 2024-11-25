import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RecipeScreen(),
    );
  }
}

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE1C4B3),
      appBar: AppBar(
        title: const Text(
          " RECIPES",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Poppins",
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color(0xFFCD8868),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Recipe Image and Title
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: const Color(0xFFCD8868),
                borderRadius: BorderRadius.circular(8),
              ),// Optional padding to give some space around the content
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Image.asset(
                      'Chicken/Air-Fryer-Chicken.jpg',
                      height: 250,
                      width: 400,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Air Fryer Chicken Breast',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),
            const Text(
              'INGREDIENTS',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: const Color(0xFFCD8868),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: const [
                  IngredientCheckbox(text: '3 chicken breasts, skinless and boneless (about 1.5 pounds)'),
                  Divider(color: Colors.white, thickness: 1),
                  IngredientCheckbox(text: '1/2 tablespoon vegetable oil'),
                  Divider(color: Colors.white, thickness: 1),
                  IngredientCheckbox(text: '1/2 teaspoon salt'),
                  Divider(color: Colors.white, thickness: 1),
                  IngredientCheckbox(text: '1/4 teaspoon ground black pepper'),
                  Divider(color: Colors.white, thickness: 1),
                  IngredientCheckbox(text: '1/2 teaspoon paprika'),
                  Divider(color: Colors.white, thickness: 1),
                  IngredientCheckbox(text: '1/2 teaspoon garlic powder'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const InstructionsScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFCD8868),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                ),
                child: const Text(
                  'Instructions',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IngredientCheckbox extends StatefulWidget {
  final String text;

  const IngredientCheckbox({required this.text, super.key});

  @override
  State<IngredientCheckbox> createState() => _IngredientCheckboxState();
}

class _IngredientCheckboxState extends State<IngredientCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isChecked,
      onChanged: (value) {
        setState(() {
          isChecked = value ?? false;
        });
      },
      title: Text(
        widget.text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: const Color(0xFFCfefefe),
      checkColor: Color(0xFFCD8868),
    );
  }
}


class InstructionsScreen extends StatefulWidget {
  const InstructionsScreen({Key? key}) : super(key: key);

  @override
  _InstructionsScreenState createState() => _InstructionsScreenState();
}




class _InstructionsScreenState extends State<InstructionsScreen> {
  // Step completion flags
  bool isCheckedStep1 = false;
  bool isCheckedStep2 = false;
  bool isCheckedStep3 = false;

  // Instruction steps
  final List<String> instructions = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    'Quis ipsum suspendisse ultrices gravida. Amet est placerat in egestas erat imperdiet. Pellentesque dignissim enim sit amet venenatis.',
    'Nulla aliquet enim tortor at auctor urna. Egestas integer eget aliquet risus. Orci eu lobortis elementum nibh tellus.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE1C4B3), // Background color for the screen
      appBar: AppBar(
        backgroundColor: const Color(0xFFCD8868), // AppBar background color
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Recipe',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
              child: Image.asset(
                'images/logoapp.png',
                fit: BoxFit.cover,
                width: 40,
                height: 40,
              ),
            ),
          ),
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Container wrapping the image and title
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: const Color(0xFFCD8868),
                borderRadius: BorderRadius.circular(8),
              ),// Optional padding to give some space around the content
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Image.asset(
                      'Chicken/Air-Fryer-Chicken.jpg',
                      height: 250,
                      width: 400,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Air Fryer Chicken Breast',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),



            const SizedBox(height: 16),
            const Text(
              'INSTRUCTIONS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // Instruction Steps
            for (int i = 0; i < instructions.length; i++) ...[
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFCD8868),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: i == 0
                              ? isCheckedStep1
                              : i == 1
                              ? isCheckedStep2
                              : isCheckedStep3,
                          onChanged: (bool? newValue) {
                            setState(() {
                              if (i == 0) {
                                isCheckedStep1 = newValue ?? false;
                              } else if (i == 1) {
                                isCheckedStep2 = newValue ?? false;
                              } else if (i == 2) {
                                isCheckedStep3 = newValue ?? false;
                              }
                            });
                          },
                          checkColor: const Color(0xFFCD8868), // Checkbox tick color
                          activeColor: Colors.white, // Checkbox active color
                        ),
                        Text(
                          'STEP ${i + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      instructions[i],
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
            // Adding the forum widget

            const SizedBox(height: 16),
            ForumWidget(), // Embedding the ForumWidget
          ],
        ),
      ),
    );
  }
}


class ForumWidget extends StatelessWidget {
  const ForumWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFCD8868), // Background color
        borderRadius: BorderRadius.circular(12.0), // Add border radius
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Forum",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color(0xFFCD8868), backgroundColor: Colors.white, // Button text color
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                ),
                child: const Text(
                  "ADD COMMENT",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          ForumPostItem(),
          const SizedBox(height: 8.0),
          ForumPostItem(),
        ],
      ),
    );
  }
}


class ForumPostItem extends StatelessWidget {
  const ForumPostItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white, width: 0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Lorem Ipsum (Client_Name) - (category)",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
