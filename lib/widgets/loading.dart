import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Attendez pendant 3 secondes
      future: Future.delayed(Duration(seconds: 3)),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        // Vérifiez si la tâche Future est terminée
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Afficher le widget de chargement
          return Container(
            color: Colors.redAccent[100],
            child: Center(
              child: SpinKitChasingDots(
                color: Colors.greenAccent,
                size: 50,
              ),
            ),
          );
        } else {
          // Si la tâche Future est terminée, ne rien afficher
          return SizedBox.shrink();
        }
      },
    );
  }
}
