<?php

include_once("../source/database.php");

function FindLeerling($conn, $name, $leeftijd) {
    $q = "SELECT * FROM leerlingen WHERE naam = ? AND leeftijd = ?;";
    $stmt = $conn->prepare($q);
    $stmt->bind_param("si", $name, $leeftijd);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result) {
        for ($i = 0; $i < $result->num_rows; $i++) {
            $row = $result->fetch_assoc();
            print_r($row);
        }
    }
}

function ShowAllLeerlingen($conn) {
    $q = "SELECT * FROM leerlingen;";
    $stmt = $conn->prepare($q);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result) {
        for ($i = 0; $i < $result->num_rows; $i++) {
            $row = $result->fetch_assoc();
            print_r($row);
        }
    }
}

$conn = database_connect();

$search   = isset($_GET["search"]) ? $_GET["search"] : null;
$leeftijd = isset($_GET["leeftijd"]) ? (int)$_GET["leeftijd"] : null;

if ($search !== null && $leeftijd !== null) {
    FindLeerling($conn, $search, $leeftijd);
} else {
    ShowAllLeerlingen($conn);
}

$conn->close();
