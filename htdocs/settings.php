<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

// Database connection details
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "mellowde";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die(json_encode(['success' => false, 'message' => 'Connection failed: ' . $conn->connect_error]));
}

// Handle POST request for user settings update
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);

    $idUser = $data['idUser'];
    $newUsername = $data['newUsername'];
    $newName = $data['newName'];
    $newEmail = $data['newEmail'];
    $newPassword = $data['newPassword'];
    $oldPassword = $data['oldPassword'];

    $updateFields = [];

    // Check if old password is provided and matches before updating
    if (!empty($oldPassword)) {
        $checkPasswordQuery = "SELECT * FROM User WHERE idUser = '$idUser' AND password = '$oldPassword'";
        $passwordResult = $conn->query($checkPasswordQuery);

        if ($passwordResult->num_rows > 0) {
            // Old password matches, proceed with updates
            if (!empty($newUsername)) {
                $updateFields[] = "username = '$newUsername'";
            }

            if (!empty($newName)) {
                $updateFields[] = "name = '$newName'";
            }

            if (!empty($newEmail)) {
                $checkEmailQuery = "SELECT * FROM User WHERE email = '$newEmail' AND idUser != '$idUser'";
                $emailResult = $conn->query($checkEmailQuery);

                if ($emailResult->num_rows == 0) {
                    $updateFields[] = "email = '$newEmail'";
                } else {
                    echo json_encode(['success' => false, 'message' => 'Email is already in use']);
                    exit();
                }
            }

            if (!empty($newPassword)) {
                $updateFields[] = "password = '$newPassword'";
            }
        } else {
            echo json_encode(['success' => false, 'message' => 'Old password is incorrect']);
            exit();
        }
    } else {
        echo json_encode(['success' => false, 'message' => 'Old password is required']);
        exit();
    }

    if (!empty($updateFields)) {
        $updateQuery = "UPDATE User SET " . implode(', ', $updateFields) . " WHERE idUser = '$idUser'";

        if ($conn->query($updateQuery) === TRUE) {
            // Fetch updated user data
            $fetchUserQuery = "SELECT * FROM User WHERE idUser = '$idUser'";
            $userDataResult = $conn->query($fetchUserQuery);
            
            if ($userDataResult->num_rows > 0) {
                $userData = $userDataResult->fetch_assoc();
                echo json_encode(['success' => true, 'message' => 'User info updated successfully', 'userData' => $userData]);
            } else {
                echo json_encode(['success' => false, 'message' => 'Failed to fetch updated user data']);
            }
        } else {
            echo json_encode(['success' => false, 'message' => 'Error updating user info: ' . $conn->error]);
        }
    }
}

$conn->close();
?>
