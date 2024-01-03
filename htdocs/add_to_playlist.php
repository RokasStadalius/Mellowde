<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "mellowde";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Prisijungimo klaida: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $songId = $_POST["songId"];
    $playlistId = $_POST["playlistId"];

    // Tikriname, ar daina jau yra pridėta į playlist'ą
    $checkQuery = "SELECT * FROM queue WHERE songId = '$songId' AND playlistId = '$playlistId'";
    $checkResult = $conn->query($checkQuery);

    if ($checkResult->num_rows > 0) {
        echo "Daina jau yra pridėta į playlist'ą.";
    } else {
        // Pridedame dainą į playlist'ą
        $insertQuery = "INSERT INTO queue (songId, playlistId) VALUES ('$songId', '$playlistId')";
        $insertResult = $conn->query($insertQuery);

        if ($insertResult === TRUE) {
            echo "Daina pridėta į playlist'ą sėkmingai.";
        } else {
            echo "Klaida pridedant dainą į playlist'ą: " . $conn->error;
        }
    }
}

$conn->close();
?>
