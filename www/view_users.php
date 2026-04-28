<?php
// view_users.php
include 'config.php'; // your database connection

$sql = "SELECT * FROM users";
$result = $conn->query($sql);
?>
<!DOCTYPE html><html>
<head>
    <title>View Users</title>
    <link rel="stylesheet" href="style.css" />
</head>
<body>  
<div class="header">
        <img src="./download.jpg" alt="Profile Photo" />
        <div class="name">Anhelyna Kikena</div>
    </div>

    <div class="title-box">
        <h1>All Users</h1>
    </div>

    <div class="links">
    <ul>
      <li><a href="./index.html" target="_blank">Go Back To My Home Page</a></li>
    <li><a href="./COSCLAB.html" target="_blank">Go Back To My COSC Lab Page</a></li>
    <li><a href="./FormValidation.html" target="_blank">Go Back To My Form Validation Page</a></li>
</ul>
    </div>
<div style="margin-left: 50px; color: green; size: 10px; font-size: 20px;">
<?php
if ($result->num_rows > 0) {
    echo "<table border='1' cellpadding='10'>";
    echo "<tr><th>First Name</th><th>Last Name</th><th>Email</th><th>Telephone</th></tr>";
    
    while($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . htmlspecialchars($row['fname']) . "</td>";
        echo "<td>" . htmlspecialchars($row['lname']) . "</td>";
        echo "<td>" . htmlspecialchars($row['email']) . "</td>";
        echo "<td>" . htmlspecialchars($row['phone_number']) . "</td>";
        echo "</tr>";
    }
    
    echo "</table>";
} else {
    echo "No users found.";
}

$conn->close();
?>
</div>
</body>
</html>