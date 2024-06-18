<?php
include "connection.php";

try {
    if (isset($_POST['nom'], $_POST['prenom'], $_POST['telephone'], $_POST['email'], $_POST['date'], $_POST['repas'], $_POST['restaurant'])) {
        $nom = $_POST['nom'];
        $prenom = $_POST['prenom'];
        $telephone = $_POST['telephone'];
        $email = $_POST['email'];
        $date = $_POST['date'];
        $repas = $_POST['repas'];
        $restaurant = $_POST['restaurant'];

        // Vérifier si une réservation avec les mêmes informations (nom, prénom, date) existe déjà
        $existingReservation = $db->prepare("SELECT * FROM reservation WHERE nom = ? AND prenom = ? AND date = ?");
        $existingReservation->execute(array($nom, $prenom, $date));
        $rowCount = $existingReservation->rowCount(); // Nombre de lignes retournées par la requête

        // Si aucune réservation existante pour cette personne et cette date
        if ($rowCount == 0) {
            $req = $db->prepare("INSERT INTO reservation (nom, prenom, telephone, email, date, repas, restaurant) VALUES (?, ?, ?, ?, ?, ?, ?)");
            $req->execute(array($nom, $prenom, $telephone, $email, $date, $repas, $restaurant));
            $success = 1;
            $msg = "Réservation réussie";
        } else {
            $success = 0;
            $msg = "Vous avez déjà réservé un repas pour cette date";
        }
    } else {
        $success = 0;
        $msg = "Erreur : données manquantes";
    }
} catch (\Throwable $th) {
    $success = 0;
    $msg = "Erreur : " . $th->getMessage();
}

echo json_encode([
    "success" => $success,
    "msg" => $msg
]);
?>
