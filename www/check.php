<?php

require 'configo.php';

$email = $_POST['emailcheck'] ?? '';

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo "Invalid email!";
    exit;
}

$stmt = $conn->prepare("SELECT id FROM emails WHERE email = ?");
$stmt->bind_param("s", $email);
$stmt->execute();
$stmt->store_result();

if ($stmt->num_rows > 0) {
    echo "Email exists in database!";
} else {
    echo "Email not found.";
}
?>