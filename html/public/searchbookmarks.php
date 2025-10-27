<?php
include_once("../source/database.php");

$connection = database_connect();

$search = isset($_GET['term']) ? $_GET['term'] : '';

$stmt = $connection->prepare("CALL searchBookmark(?)");
if ($stmt === false) {
    $connection->close();
    die("Prepare failed: " . $connection->error);
}

if (! $stmt->bind_param("s", $search)) {
    $stmt->close();
    $connection->close();
    die("Bind failed: " . $stmt->error);
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

while ($connection->more_results() && $connection->next_result()) {
    $junk = $connection->use_result();
    if ($junk instanceof mysqli_result) {
        $junk->free();
    }
}

$stmt->close();
$connection->close();
