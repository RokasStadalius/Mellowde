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

// Get data from the POST request
$playlistId = $_POST['playlistId'];
$userId = $_POST['userId'];
$rating = $_POST['rating'];

// Prepare and execute SQL query to insert the rating into the playlistrating table
$sql = "INSERT INTO playlistrating (playlistId, userId, rating) VALUES ('$playlistId', '$userId', '$rating')";

if ($conn->query($sql) === TRUE) {
    // Rating added successfully
    $response['success'] = true;
    $response['message'] = 'Rating added successfully';
} else {
    // Failed to add rating
    $response['success'] = false;
    $response['message'] = 'Failed to add rating: ' . $conn->error;
}

// Close the database connection
$conn->close();

// Send the JSON response
header('Content-Type: application/json');
echo json_encode($response);
?>