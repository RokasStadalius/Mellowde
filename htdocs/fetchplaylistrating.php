<?php
// Replace with your database connection details
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "mellowde";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get playlist ID from the POST request
$playlistId = $_POST['playlistId'];

// Prepare and execute SQL query to fetch average rating for the given playlist
$sql = "SELECT AVG(rating) AS averageRating FROM playlistrating WHERE playlistId = '$playlistId'";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $response['averageRating'] = $row['averageRating'];
} else {
    // If there are no ratings for the playlist, set averageRating to 0
    $response['averageRating'] = 0.0;
}

// Close the database connection
$conn->close();

// Send the JSON response
header('Content-Type: application/json');
echo json_encode($response);
?>
