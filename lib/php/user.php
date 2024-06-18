<?php


$users = array(
    array("id" => 6, "nom" => "Diop", "prenom" => "Ndeye Cheikh",  "telephone" => 1234567, "email" => "ndeyecdiop03","password" =>"123456" ),
    
);

// Vérification du paramètre d'URL pour déterminer l'action à effectuer
if(isset($_GET['action'])) {
    $action = $_GET['action'];

    // Endpoint pour récupérer tous les utilisateurs
    if($action == 'getUsers') {
        echo json_encode($users);
    }

    // Endpoint pour récupérer un utilisateur par ID
    elseif($action == 'getUserById' && isset($_GET['id'])) {
        $userId = $_GET['id'];
        foreach($users as $user) {
            if($user['id'] == $userId) {
                echo json_encode($user);
                break;
            }
        }
    }
}

?>
