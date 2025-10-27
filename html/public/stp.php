<?php
$connection = new mysqli('mariadb', 'appStpUser', 'appStpUser!2024', 'm5prog');
if ($connection->connect_errno) {
    die('Connection failed: ' . $connection->connect_error);
}

$stmt = $connection->prepare('CALL getAllWebbookmarks()');
if ($stmt === false) {
    $connection->close();
    die('Prepare failed: ' . $connection->error);
}

if (! $stmt->execute()) {
    $stmt->close();
    $connection->close();
    die('Execution failed: ' . $stmt->error);
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
