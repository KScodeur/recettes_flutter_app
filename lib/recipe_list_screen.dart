import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/recipe.dart';
import 'package:restaurant_app/recipe_screen.dart';

class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({super.key});

  @override
  State<RecipeListScreen> createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  final List<Recipe> recipes = [
    Recipe(
      "Pizza facile",
      "Par KScodeur",
      "https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "1-  Faire cuire dans une poele les lardons et les champignons. \n 2-  Dans un bol, verser la boite de concentré de tomate, y ajouter un demi verre d'eau, ensuite mettre un carré de sucre(pour enlever l'acidité de la tomate) une pincée de sel, de poivre, et une pincée d'herbe de Provence.",
      true,
      10,
    ),
    Recipe(
      "Pizza facile",
      "Par KScodeur",
      "https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "1-  Faire cuire dans une poele les lardons et les champignons. \n 2-  Dans un bol, verser la boite de concentré de tomate, y ajouter un demi verre d'eau, ensuite mettre un carré de sucre(pour enlever l'acidité de la tomate) une pincée de sel, de poivre, et une pincée d'herbe de Provence.",
      false,
      50,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes recettes"),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return RecipeItemWidget(recipe: recipe);
          // Dismissible(
          //     key: Key(recipe.title),
          //     onDismissed: (DismissDirection direction) {
          //       setState(() {
          //         recipes.removeAt(index);
          //       });
          //       // ScaffoldMessenger.of(context).showSnackBar(
          //       //     SnackBar(content: Text("${recipe.title} supprimé")));
          //     },
          //     background: Container(color: Colors.blue,),
          //     child: RecipeItemWidget(recipe: recipe));
        },
      ),
    );
  }
}

class RecipeItemWidget extends StatelessWidget {
  const RecipeItemWidget({super.key, required this.recipe});
  final Recipe recipe;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return RecipeScreen(recipe: recipe);
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              animation =
                  CurvedAnimation(parent: animation, curve: Curves.ease);
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(8),
        elevation: 4,
        child: Row(
          children: [
            //hero c'est pour l'animation
            // Hero(
            //   tag: "imageRecipe${recipe.title}",
            //   child: 
            CachedNetworkImage(
                imageUrl: recipe.imageUrl,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      recipe.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Text(recipe.user,
                      style: TextStyle(color: Colors.grey[500], fontSize: 16))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
