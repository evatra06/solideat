import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:solideat_projet/screens/login.dart';
import 'package:solideat_projet/screens/restaurant.dart';
import 'package:solideat_projet/widgets/customtext.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class InscriptionPage extends StatelessWidget {
   InscriptionPage({Key? key}) : super(key: key);
final _key = GlobalKey<FormState>();
void inscription(String nom, String prenom, String telephone, String email, String password) async{
final response = await http.post(
  Uri.parse('https://soldeat.000webhostapp.com/solideat/inscription.php'),
  body: {
    'nom':nom,
    'prenom':prenom,
    'telephone':telephone,
    'email':email,
    'password': password,
  },
);
if (response.statusCode == 200){
  var data = jsonDecode(response.body);
  print(data);
}
}

 CustomTextField nomText = new CustomTextField(
    title: "nom",
    placeholder: "Enter nom", fontSize: 0,
  );
  CustomTextField prenomText = new CustomTextField(
    title: "prenom",
    placeholder: "Enter prenom", fontSize: 0,
  );
  CustomTextField telephoneText = new CustomTextField(
    title: "telephone",
    placeholder: "Enter telephone", fontSize: 0,
  );

  CustomTextField emailText = new CustomTextField(
    title: "email",
    placeholder: "Enter email", fontSize: 0,
  );
  CustomTextField passText = new CustomTextField(
      title: "password", placeholder: "***********", ispass: true, fontSize: 0);
       CustomTextField confirmPassText = new CustomTextField(
      title: "confirmPassword", placeholder: "***********", ispass: true, fontSize: 0);
  @override
  Widget build(BuildContext context) {
     
    nomText.err = "enter nom";
    prenomText.err = "enter prenom";
    telephoneText.err = "enter telephone";
     emailText.err = "enter email";
    passText.err = "enter password";
    return Scaffold(
     body: SingleChildScrollView(
  child: Stack(
    children: [
      // Background Image
      Positioned.fill(
        child: Image.asset(
          'assets/fond2.jpg',
          fit: BoxFit.fill,
        ),
      ),
      // Contenu de la page
      Form(
        key: _key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Titre "SolidEat"
            const Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Text(
                'SolidEat',
                style: TextStyle(
                  fontFamily: 'DancingScript-Bold',
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            // Formulaire d'inscription
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  nomText.textfrofield(),
                  SizedBox(
                    height: 10,
                  ),
                  prenomText.textfrofield(),
                  SizedBox(
                    height: 10,)
                    ,
                  telephoneText.textfrofield(),
                  SizedBox(
                    height: 10,),
                  emailText.textfrofield(),
                  SizedBox(
                    height: 10,
                  ),
                  passText.textfrofield(),
                  SizedBox(
                    height: 10,),
                     confirmPassText.textfrofield(),
                    SizedBox(
                      height: 10,
                    ),
                  ElevatedButton(
                    onPressed: () async{
                      if(passText.value == confirmPassText.value){
                              inscription(nomText.value, prenomText.value, telephoneText.value, emailText.value, passText.value);
                             Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RestaurantPage()), // Remplace la page actuelle
      );
                            }else{
                              print("les mots de passes sont différents");
                            }
                          },
                   
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(157, 255, 197, 197),
                      // Couleur de fond rose
                    ),
                    child: const Text(
                      'S\'inscrire',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18, // Couleur du texte noir
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Vous êtes déjà membre ? ',
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  LoginPage()),
                          );
                        },
                        child: const Text(
                          'Connectez-vous',
                          style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    ],
  ),
),

    );
  }

  
}


