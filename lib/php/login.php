<?php
include "connection.php";

try {
    if (isset($_POST['email'], $_POST['password'])) {
        $email = $_POST['email'];
        $password = $_POST['password'];
    
        $req = $db->prepare("SELECT nom, prenom, telephone, email FROM utilisateur WHERE email=? AND password=?");
        $req->execute(array($email, $password));
        $exist = $req->rowCount();
        if ($exist == 1) {
            $array = $req->fetch(PDO::FETCH_ASSOC); // Utilisez FETCH_ASSOC pour obtenir un tableau associatif
            $msg = "Connexion réussie";
            $success = 1;
        } else {
            $msg = "L'email ou le mot de passe est incorrect";
            $success = 0;
            $array = null; // Assurez-vous que $array est défini même en cas d'échec
        }
    } else {
        $success = 0;
        $msg = "Erreur : données vides"; 
        $array = null; // Assurez-vous que $array est défini même en cas de données vides
    }
} catch (\Throwable $th) {
    $success = 0;
    $msg = "Erreur : " . $th->getMessage();
    $array = null; // Assurez-vous que $array est défini même en cas d'erreur
}

if ($success == 1) {
    // Les données statiques sont incluses ici si la connexion est réussie
    $data = array(
        "nom" => "Doe",
        "prenom" => "John",
        "telephone" => "123456789",
        "email" => "john.doe@example.com"
    );
} else {
    $data = null;
}

echo json_encode([
    "success" => $success,
    "msg" => $msg,
    "data" => $data
]);
?>
