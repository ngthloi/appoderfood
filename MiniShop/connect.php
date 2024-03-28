<?php
$host = 'localhost';
$user = 'root';
$pass = '';
$database = 'minishop';

$conn = mysqli_connect($host, $user, $pass, $database); 
mysqli_set_charset($conn, 'utf8');
// mysqli_query($conn, "SET NAMES 'utf8'");


?>