<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

$user = 'root';
$pass = 'u2iuy23dy2';
$host = 'mysql';
$db = 'test_db';

try {
    $dbh = new PDO('mysql:host=' . $host, $user, $pass);
} catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}

echo 'Connected!';
?>