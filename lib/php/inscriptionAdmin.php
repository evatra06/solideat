<?php
include "connection.php"; 

$nomAdmin = $_POST['nomAdmin'];
$prenomAdmin = $_POST['prenomAdmin'];
$telephoneAdmin = $_POST['telephoneAdmin'];
$email = $_POST['email'];
$password = $_POST['password'];

try {
    if(isset($nomAdmin, $prenomAdmin, $telephoneAdmin, $email, $password)){
        $req = $db->prepare("SELECT * FROM RestaurateurAdmin WHERE email=?");
        $req->execute(array($email));
        $exist = $req->rowCount();
        if($exist == 0){
            $req = $db->prepare("INSERT INTO RestaurateurAdmin (nomAdmin, prenomAdmin, telephoneAdmin, email, password) VALUES (?, ?, ?, ?, ?)");
            $req->execute(array($nomAdmin, $prenomAdmin, $telephoneAdmin, $email, $password));
            if($req){
                $success = 1;
                $msg = "Inscription réussie";
            }else{
                $success = 0;
                $msg = "Erreur lors de l'inscription";
            }
        }else{
            $msg = "L'e-mail existe déjà";
            $success = 0;
        }
    }else{
       $success = 0;
       $msg = "Données vides"; 
    }
} catch (\Throwable $th) {
    $success = 0;
    $msg = "Erreur: ".$th->getMessage();
}
header('Content-Type: application/json'); // Ajout du header pour spécifier le type de contenu JSON
echo json_encode([
    "message" => $msg,
    "success" => $success
]);
?>
