<?php
$servername = "localhost";
$username   = "root";
$password   = "";
$dbname     = "meandmarketdb";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}else{
    echo "Genduk";
}
?>