import 'package:flutter/material.dart';
// import 'package:restaurant_app/recipe.dart';
import 'package:restaurant_app/recipe_list_screen.dart';
// import 'package:restaurant_app/recipe_screen.dart';

// import 'package:transparent_image/transparent_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RecipeListScreen(),
      //RecipeScreen(recipe: Recipe(
      //   "Pizza facile",
      //   "Par KScodeur",
      //   "https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      //   "1-  Faire cuire dans une poele les lardons et les champignons. \n 2-  Dans un bol, verser la boite de concentré de tomate, y ajouter un demi verre d'eau, ensuite mettre un carré de sucre(pour enlever l'acidité de la tomate) une pincée de sel, de poivre, et une pincée d'herbe de Provence.",
      //   false,
      //   50,
      // )),
    );
  }
}
