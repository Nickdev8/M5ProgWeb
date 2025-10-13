<?php
include_once("../source/database.php");

$conn = database_connect();

$search = isset($_GET['search']) ? $_GET['search'] : '';

$q = "SELECT * FROM leerlingen WHERE naam = '$search';";

if ($conn->multi_query($q)) {
    do {
        $result = $conn->store_result();
        if ($result) {
            while ($row = $result->fetch_assoc()) {
                print_r($row);
            }
            $result->free();
        } else {
            printf("no resultset, errno=%d, error=%s\n", $conn->errno, $conn->error);
        }
    } while ($conn->more_results() && $conn->next_result());
} else {
    echo "multi_query failed: (" . $conn->errno . ") " . $conn->error . "\n";
}

$conn->close();
