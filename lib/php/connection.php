<?php
$host = "localhost";
$dbname = "id22077738_solideat";
$user = "id22077738_solideat";
$pass = "BEATRICe06*";
try {
  $db = new PDO("mysql:host=$host;dbname=$dbname", $user, $pass); 
  //echo "Connected";
} catch(\Throwable $th) {
  //echo "Error: " . $th->getMessage(); 
}
?>
