<?php

include_once("../source/database.php");

function FindLeerling($conn, $name) {
    $q = "SELECT * FROM leerlingen WHERE naam = ?;";

    $stmt = $conn->prepare($q);
    $stmt->bind_param("s", $name);
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

FindLeerling($conn, "mario' or leeftijd > 0 or naam = 'mario");

// $search = $_GET["search"];
// FindLeerling($conn, $search);