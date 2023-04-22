import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'favorite_widget.dart';
import 'recipe.dart';


class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
        padding: const EdgeInsets.all(8),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child:  Text(
                    recipe.title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                 Text(
                  recipe.user,
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                )
              ],
            ),
          ),
           FavoriteWidget(
            isFavorited: recipe.isFavorite,
            favoriteCount: recipe.favoriteCount,
          ),
        ]));

    Widget commentAndShareSection = Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildButtonColumn(Colors.blue, Icons.comment, 'Comment'),
            _buildButtonColumn(Colors.blue, Icons.share, 'Share'),
          ],
        ));
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("Mes recettes"),
        ),
        body: Column(children: [
          // Hero(
          //   tag: "imageRecipe${recipe.title}",
          //   child: 
          CachedNetworkImage(
              imageUrl:recipe.imageUrl,
                  // 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
          // ),
          titleSection,
          commentAndShareSection,
          Container(
              padding: const EdgeInsets.all(8),
              child:  Text( recipe.description,
                // "1-  Faire cuire dans une poele les lardons et les champignons. \n 2-  Dans un bol, verser la boite de concentré de tomate, y ajouter un demi verre d'eau, ensuite mettre un carré de sucre(pour enlever l'acidité de la tomate) une pincée de sel, de poivre, et une pincée d'herbe de Provence.",
                softWrap: true,
              )),
        ]));
  }
}

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
          padding: const EdgeInsets.only(bottom: 8),
          child: Icon(
            icon,
            color: color,
          )),
      Text(label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.blue,
          ))
    ],
  );
}
