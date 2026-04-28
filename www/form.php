<?php
include 'config.php';

$fname = $_POST["fname"];
$lname = $_POST["lname"];
$email = $_POST["email"];
$phone_number = $_POST["phone_number"];

$sql = "INSERT INTO users (fname, lname, email, phone_number)
        VALUES ('$fname', '$lname', '$email', '$phone_number')";

if (!$conn->query($sql)) {
    echo "MYSQL ERROR: " . $conn->error;
}


echo "<h1>Form Data Received</h1>";
echo "First Name: " . htmlspecialchars($fname) . "<br>";
echo "Last Name: " . htmlspecialchars($lname) . "<br>";
echo "Email: " . htmlspecialchars($email) . "<br>";
echo "Telephone: " . htmlspecialchars($phone_number) . "<br>";

$conn->close();
?>