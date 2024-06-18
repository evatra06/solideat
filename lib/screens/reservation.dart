import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:solideat_projet/screens/login.dart';
import 'package:solideat_projet/widgets/customtext.dart';
import 'package:http/http.dart' as http;

class ReservationPage extends StatefulWidget {
  ReservationPage({Key? key}) : super(key: key);

  @override
  _ReservationPageState createState() => _ReservationPageState();

  // Méthode pour l'inscription
  void reservation(String nom, String prenom, String telephone, String email, String date, String repas, String restaurant) async {
    final response = await http.post(
      Uri.parse('https://soldeat.000webhostapp.com/solideat/reservation.php'),
      body: {
        'nom': nom,
        'prenom': prenom,
        'telephone': telephone,
        'email': email,
        'date': date,
        'repas': repas,
         'restaurant': restaurant,
      },
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
    }
  }
}

class _ReservationPageState extends State<ReservationPage> {
  DateTime? _selectedDate;
  String? _selectedMeal;
  String? _selectedRestaurant; // Nouvel attribut pour stocker le restaurant sélectionné
  final _key = GlobalKey<FormState>();
  CustomTextField nomText = CustomTextField(
    title: "nom",
    placeholder: "Enter nom",
    fontSize: 0,
  );
  CustomTextField prenomText = CustomTextField(
    title: "prenom",
    placeholder: "Enter prenom",
    fontSize: 0,
  );
  CustomTextField telephoneText = CustomTextField(
    title: "telephone",
    placeholder: "Enter telephone",
    fontSize: 0,
  );
  CustomTextField emailText = CustomTextField(
    title: "email",
    placeholder: "Enter email",
    fontSize: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                'assets/fond2.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Titre "SolidEat"
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
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
                        SizedBox(height: 10),
                        prenomText.textfrofield(),
                        SizedBox(height: 10),
                        telephoneText.textfrofield(),
                        SizedBox(height: 10),
                        emailText.textfrofield(),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );
                            if (picked != null && picked != _selectedDate) {
                              setState(() {
                                _selectedDate = picked;
                              });
                            }
                          },
                          child: AbsorbPointer(
                            child: TextFormField(
                              readOnly: true,
                              controller: TextEditingController(
                                text: _selectedDate != null
                                    ? _selectedDate.toString()
                                    : '',
                              ),
                              decoration: InputDecoration(
                                labelText: 'Date',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        // Dropdown pour le choix de repas
                        DropdownButtonFormField<String>(
                          value: _selectedMeal,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedMeal = newValue;
                            });
                          },
                          items: <String>[
                            'Petit déjeuner',
                            'Déjeuner',
                            'Dîner'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            labelText: 'Choix de repas',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 10),
                        // Dropdown pour le choix du restaurant
                        DropdownButtonFormField<String>(
                          value: _selectedRestaurant,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedRestaurant = newValue;
                            });
                          },
                          items: <String>[
                            'Restaurant 1',
                            'Restaurant 2',
                            'Restaurant 3',
                            'Restaurant 4',
                            'Restaurant 5'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            labelText: 'Choix du restaurant',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 100),
                        ElevatedButton(
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              // Appeler la méthode de réservation avec les données du formulaire
                              widget.reservation(
                                nomText.controller.text,
                                prenomText.controller.text,
                                telephoneText.controller.text,
                                emailText.controller.text,
                                _selectedDate.toString(),
                                _selectedMeal!,
                                _selectedRestaurant!, // Inclure le restaurant sélectionné
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(157, 255, 197, 197),
                          ),
                          child: const Text(
                            'Valider',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              ' ',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 15),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()),
                                );
                              },
                              child: Text(
                                '',
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
            ),
          ],
        ),
      ),
    );
  }
}

