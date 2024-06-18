import 'package:flutter/material.dart';
import 'package:solideat_projet/screens/accueil.dart';
import 'package:solideat_projet/screens/avis.dart';
import 'package:solideat_projet/screens/login.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(176, 82, 62, 71),
        centerTitle: true,
        leading: GestureDetector(
          child: const Stack(
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Contenu de la page
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name Surname',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'exemple@exemple.com',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.account_circle,
                      size: 50.0,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildOptionBlock(context, 'favorites', Icons.favorite, accueilPage()),

                  _buildOptionBlock(context,'Notifications', Icons.notifications, accueilPage()), 
                ],
              ),
              const SizedBox(height: 20.0),
              _buildOptionLine(context, 'Your Order', Icons.shopping_cart,  accueilPage()), 
              const SizedBox(height: 10,),
              _buildOptionLine(context, 'About', Icons.info, accueilPage()),
               const SizedBox(height: 10,),
              _buildOptionLine(context, 'Avis', Icons.rate_review, Avis()), 
               const SizedBox(height: 10,),
              _buildOptionLine(context, 'Aide', Icons.help, accueilPage()), 
               const SizedBox(height: 10,),
              _buildOptionLine(context, 'Log Out', Icons.logout, LoginPage()), 
            ],
          ),
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

  Widget _buildOptionBlock(BuildContext context, String title, IconData icon,  destination) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => destination,
          ),
        );
      },
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color:Colors.grey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30.0,
              color: Colors.black,
            ),
            const SizedBox(height: 7.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionLine(BuildContext context, String title, IconData icon, Widget destination) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => destination,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 27.0,
              color: Colors.black,
            ),
            const SizedBox(width: 9.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
