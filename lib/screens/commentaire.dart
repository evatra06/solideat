import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CommentairePage extends StatefulWidget {
  @override
  _CommentairePageState createState() => _CommentairePageState();
}

class _CommentairePageState extends State<CommentairePage> {
  String commentaireText = '';

  @override
  void initState() {
    super.initState();
    // Appel de votre API pour récupérer les données de l'utilisateur
    fetchData();
  }

  Future<void> fetchData() async {
    // Appel de votre API pour récupérer les données de l'utilisateur
    var response = await http.get(Uri.parse('http://votre-api.com/user-data'));
    var jsonData = jsonDecode(response.body);

    // Mise à jour de l'état avec le nom de l'utilisateur
    setState(() {
      commentaireText = 'Bonjour ${jsonData['nom']} ${jsonData['prenom']}, ';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un commentaire'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ajouter un commentaire :',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                hintText: 'Ajouter un commentaire...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
              controller: TextEditingController(text: commentaireText),
              onChanged: (value) {
                commentaireText = value;
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Logique pour soumettre le commentaire ici
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Envoyer',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

