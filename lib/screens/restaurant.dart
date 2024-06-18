import 'package:flutter/material.dart';
import 'package:solideat_projet/screens/login.dart';
import 'package:solideat_projet/screens/restaurant1.dart';
import 'package:solideat_projet/screens/restaurant2.dart';
import 'package:solideat_projet/screens/restaurant3.dart';
import 'package:solideat_projet/screens/restaurant4.dart';

class RestaurantPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Restaurants',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 39, 1, 1),
        centerTitle: true,
        leading: GestureDetector(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 5, top: 5.0),
                child: Icon(
                  Icons.circle,
                  color: Colors.white,
                  size: 43,
                ),
              ),
              Positioned(
                left: 15,
                bottom: 19,
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text('Liste des restaurants', style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          _buildRestaurantBox(context, 'Chanzy', 'Chanzy est un restaurant du cœur dédié à aider les personnes dans le besoin en leur offrant des repas chauds', 'assets/restau2.jpg', DescriptionPage1()),
          SizedBox(height: 20),
          _buildRestaurantBox(context, 'Vellefaux', 'Vellefaux est un restaurant du cœur dédié à aider les personnes dans le besoin en leur offrant des repas chauds', 'assets/restau1.jpg', DescriptionPage2()),
          SizedBox(height: 20), 
          _buildRestaurantBox(context, 'Marché de l\'europe', 'Le Marché de l\'Europe est un restaurant du cœur dédié à aider les personnes dans le besoin en leur offrant des repas chauds', 'assets/descriptionrestau.jpg', DescriptionPage3()),
          SizedBox(height: 20),
          _buildRestaurantBox(context, 'joseph de maistre', 'Joseph de Maistre est un restaurant du cœur dédié à aider les personnes dans le besoin en leur offrant des repas chauds', 'assets/design_sans_titre.png', DescriptionPage4()),
          SizedBox(height: 20), 
          _buildRestaurantBox(context, 'Restaurant E', 'Description du restaurant E.', 'assets/fond_rouge.jpg', DescriptionPage1()),
          SizedBox(height: 20), 
        ],
      ),
    );
  }

 Widget _buildRestaurantBox(BuildContext context, String name, String description, String imagePath,  destination) { // Prenez la classe de la page de destination comme paramètre
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: InkWell( // Utilisez InkWell pour rendre le conteneur cliquable
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => destination, // Utilisez la classe de la page de destination comme constructeur
            ),
          );
        },
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
