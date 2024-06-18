import 'package:flutter/material.dart';
import 'package:solideat_projet/screens/login.dart';
import 'package:solideat_projet/screens/payment.dart';
import 'package:solideat_projet/screens/reservation.dart';
import 'package:solideat_projet/screens/restaurant.dart';
import 'package:solideat_projet/screens/restaurant1.dart';
import 'package:solideat_projet/screens/restaurant3.dart';
import 'settings.dart';

class accueilPage extends StatelessWidget {
  const accueilPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var clipRRect = ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Image.asset(
        'assets/repas1.jpg', 
        height: 260,
        width: 500,
        fit: BoxFit.fitWidth,
      ),
    );

    List<String> imagePaths = [
      'assets/repas1.jpg',
      'assets/repas2.jpg',
      'assets/repas3.jpg',
      'assets/repas4.jpg',
      'assets/repas5.jpg',
      'assets/repas6.jpg',
      'assets/repas7.jpg',
    ];

    // Inverser l'ordre de la liste
    imagePaths = imagePaths;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: 
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 0), // Ajoute un padding vertical à la section de l'image
              child: Align(
                alignment: Alignment.center,
                child: clipRRect,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(color: Colors.black), // Bordure noire
                  ),
                ),
              ),
            ),
            Center( // Centrer horizontalement le Row
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 GestureDetector(
  onTap: () {
   Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReservationPage()),
    );
  },
  child: ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Container(
      width: 150,
      height: 50,
      color: const Color.fromARGB(178, 230, 137, 180), // Couleur du premier bloc
      child: const Center(
        child: Text(
          'Reservation',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
    ),
  ),
),
            GestureDetector(
              onTap: () {
   Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RestaurantPage()),
    );
  },
              
              child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child:Container(
                      width: 150,
                      height: 50,
                      color: const Color.fromARGB(178, 230, 137, 180), // Couleur du deuxième bloc
                      child: const Center(
                        child: Text(
                          'Nos restaurants',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                    ),
                  ),)
                  
                ],
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 50.0 ,top: 47),
                child: Text(
                  'A Proximité',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                     Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DescriptionPage3()),
    );
                    },
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox(
                            width: 150,
                            height: 150,
                            child: Image.asset('assets/repas4.jpg'),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Marché de l\'europe',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color:  Color.fromARGB(255, 78, 77, 77)),
                            Icon(Icons.star, color:  Color.fromARGB(255, 78, 77, 77)),
                            Icon(Icons.star, color:  Color.fromARGB(255, 78, 77, 77)),
                            Icon(Icons.star, color:  Color.fromARGB(255, 78, 77, 77)),
                            Icon(Icons.star_half, color: Colors.yellow),
                          ],
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DescriptionPage1()),
    );
                    },
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox(
                            width: 150,
                            height: 150,
                            child: Image.asset('assets/repas2.jpg'),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Chanzy",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Color.fromARGB(255, 78, 77, 77)),
                            Icon(Icons.star, color:  Color.fromARGB(255, 78, 77, 77)),
                            Icon(Icons.star, color: Color.fromARGB(255, 78, 77, 77)),
                            Icon(Icons.star, color:  Color.fromARGB(255, 78, 77, 77)),
                            Icon(Icons.star_border, color: Colors.yellow),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30.0),
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(178, 230, 137, 180),
    minimumSize: const Size(200, 50), 
    textStyle: const TextStyle(fontSize: 20.0), 
  ),
  onPressed: () {
     Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PaymentPage()),
    );
  },
  child: const Text('Faire un don', style: TextStyle(fontSize: 20.0,color: Color.fromARGB(255, 14, 14, 14),fontWeight: FontWeight.bold)),
),

const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 50.0 ,top: 47),
                child: Text(
                  'Voir nos repas',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),


            SizedBox(
              height: 150,// Hauteur du conteneur d'images
              child: ListView.builder(
                reverse: true, // Inverser la direction de défilement
                scrollDirection: Axis.horizontal, // Défilement horizontal
                itemCount: imagePaths.length, // Nombre d'images à afficher
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        width: 150,
                        height: 150,
                        imagePaths[index], // Chemin de l'image
                        fit: BoxFit.cover, // Ajuster l'image pour couvrir tout le conteneur
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
 bottomNavigationBar: BottomAppBar(
  color: const Color.fromARGB(178, 230, 137, 180), // Couleur de fond
  elevation: 10, // Élévation pour donner une impression de profondeur
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Alignement des éléments
    children: <Widget>[
      IconButton(
        icon: Icon(Icons.menu, size: 30, color: Colors.white), 
        onPressed: () {
            Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => accueilPage()),
    );
         
        },
      ),
      IconButton(
        icon: Icon(Icons.event, color: Colors.white), 
        onPressed: () {
            Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
        },
      ),
      IconButton(
        icon: Icon(Icons.settings, size: 30, color: Colors.white), 
        onPressed: () {
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingsPage()),
    );
        },
      ),
    ],
  ),
),
    );
  }
}