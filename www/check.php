<?php
/*error_reporting(E_ALL);
ini_set("display_errors", 1);

require "configo.php";

if (!isset($_POST['email'])) {
    echo "No email received.";
    exit;
}

$email = $conn->real_escape_string($_POST['email']);

$sql = "SELECT * FROM emails WHERE email='$email'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "Email exists in the database!";
} else {
    echo "Email NOT found.";
}

$conn->close();

require 'configo.php';

$result = $conn->query("SELECT email FROM emails ORDER BY id DESC");

$emails = [];

while ($row = $result->fetch_assoc()) {
    $emails[] = $row['email'];
}

echo json_encode($emails);*/

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