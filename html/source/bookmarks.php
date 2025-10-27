<?php

require_once __DIR__ . "/database.php";

$connection = database_connect();

$stmt = $connection->prepare("CALL getAllWebbookmarks()");
if ($stmt === false) {
    die("Prepared statement failed: " . $connection->error);
}

if (! $stmt->execute()) {
    $stmt->close();
    $connection->close();
    die("Execution failed: " . $stmt->error);
}

$result = $stmt->get_result();
$rows = $result ? $result->fetch_all(MYSQLI_ASSOC) : [];

print_r($rows);

if ($result) {
    $result->free();
}

// advance past additional result sets returned by CALL
while ($connection->more_results() && $connection->next_result()) {
    $junk = $connection->use_result();
    if ($junk instanceof mysqli_result) {
        $junk->free();
    }
}

$stmt->close();
$connection->close();
