<?php
include_once("../source/database.php");

$conn = database_connect();
$name = isset($_GET['search']) ? $_GET['search'] : null;

if ($name) {
    $q = "SELECT * FROM leerlingen WHERE naam = ?";
    $stmt = $conn->prepare($q);
    $stmt->bind_param("s", $name);
    $stmt->execute();
    $res = $stmt->get_result();
    while ($row = $res->fetch_assoc()) {
        print_r($row);
    }
    $res->free();
    $stmt->close();
} else {
    $q = "SELECT * FROM leerlingen";
    $stmt = $conn->prepare($q);
    $stmt->execute();
    $res = $stmt->get_result();
    while ($row = $res->fetch_assoc()) {
        print_r($row);
    }
    $res->free();
    $stmt->close();
}

$conn->close();
