<?php
/*error_reporting(E_ALL);
ini_set("display_errors", 1);

require "configo.php";

if (!isset($_POST['email'])) {
    echo "No email received.";
    exit;
}

$email = $conn->real_escape_string($_POST['email']);

$check = $conn->query("SELECT * FROM emails WHERE email='$email'");

if ($check->num_rows > 0) {
    echo "This email already exists in the database.";
} else {
    $sql = "INSERT INTO emails (email) VALUES ('$email')";
    if ($conn->query($sql)) {
        echo "Email stored successfully!";
    } else {
        echo "Database error: " . $conn->error;
    }
}

$conn->close();*/
require 'configo.php';

$email = $_POST['email'] ?? '';

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo "Invalid email!";
    exit;
}

$check = $conn->prepare("SELECT id FROM emails WHERE email = ?");
$check->bind_param("s", $email);
$check->execute();
$check->store_result();

if ($check->num_rows > 0) {
    echo "Email already exists!";
    exit;
}

// Insert new email
$stmt = $conn->prepare("INSERT INTO emails (email) VALUES (?)");
$stmt->bind_param("s", $email);
$stmt->execute();

echo "Email saved!";
?>