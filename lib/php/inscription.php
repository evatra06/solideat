<?php
include "connection.php"; 

$nom = $_POST['nom'];
$prenom = $_POST['prenom'];
$telephone = $_POST['telephone'];
$email = $_POST['email'];
$password = $_POST['password'];
 
try {

    if(isset($nom, $prenom, $telephone, $email, $password)){
        $req = $db->prepare("SELECT * FROM utilisateur WHERE email=?");
        $req->execute(array($email));
        $exist = $req->rowCount();
        if($exist == 0){
        $req = $db->prepare("INSERT INTO utilisateur (nom, prenom, telephone, email, password) VALUES (?, ?, ?, ?, ?)");
        $req->execute(array($nom, $prenom, $telephone, $email, $password));
        if($req){
            $succes = 1;
            $msg = "success register";
        }else{
            $succes = 0;
            $msg = "error register";
        }
    }else{
            $msg = "email arealy exist";
            $succes = 0;
        }
    }else{
       $succes = 0;
       $msg = "error empty data"; 
    }
} catch (\Throwable $th) {
    $succes = 0;
    $msg = "Error: ".$th->getMessage();
}
header('Content-Type: application/json'); // Ajout du header pour spécifier le type de contenu JSON
echo json_encode([
    "data"=>[
        "message" => $msg,
        "success" => $succes
    ]
]);
?>
