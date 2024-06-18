import 'package:flutter/material.dart';
import 'package:solideat_projet/screens/accueil.dart';
import 'package:solideat_projet/screens/calendart.dart';
import 'package:solideat_projet/screens/commentaire.dart';
import 'package:solideat_projet/screens/inscription.dart';
import 'package:solideat_projet/screens/avis.dart';
import 'package:solideat_projet/screens/inscritptionAdmin.dart';
import 'package:solideat_projet/screens/login.dart';
import 'package:solideat_projet/screens/payment.dart';
import 'package:solideat_projet/screens/reservation.dart';
import 'package:provider/provider.dart';
import 'package:solideat_projet/screens/restaurant.dart';
import 'package:solideat_projet/screens/restaurant1.dart';
import 'package:solideat_projet/screens/restaurant4.dart';
import 'package:solideat_projet/screens/settings.dart';
import 'package:solideat_projet/screens/spam.dart'; // Importez le package Provider

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:CommentairePage(),
    );
  }
}
