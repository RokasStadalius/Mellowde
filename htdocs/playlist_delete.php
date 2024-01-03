<?php
// Prijungiame prie duomenų bazės
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "mellowde";

$conn = new mysqli($servername, $username, $password, $dbname);

// Tikriname prisijungimą
if ($conn->connect_error) {
    die("Prisijungimo klaida: " . $conn->connect_error);
}

// Funkcija ištrinti playlist'ą
function deletePlaylist($playlistId) {
    global $conn;

    // Ištriname iš playlist lenteles
    $deletePlaylistQuery = "DELETE FROM playlist WHERE playlistId = '$playlistId'";
    $result = $conn->query($deletePlaylistQuery);

    if ($result === TRUE) {

        http_response_code(200); // Sėkmingas atsakymas
        echo "Playlist ištrintas sėkmingai.";
    } else {
        http_response_code(500); // Klaidos atveju
        echo "Klaida ištrinant playlist'ą: " . $conn->error;
    }
}

function deletePlaylistUser($playlistId) {
    global $conn;

    // Ištriname iš playlistuser lenteles
    $deletePlaylistUserQuery = "DELETE FROM playlistuser WHERE playlistId = '$playlistId'";
    $result = $conn->query($deletePlaylistUserQuery);

    if ($result === TRUE) {
        deletePlaylist($playlistId);

        echo "Playlistuser įrašai ištrinti sėkmingai.";
    } else {
        echo "Klaida ištrinant playlistuser įrašus: " . $conn->error;
    }
}

// Pavyzdinė užklausa ištrinti playlist'ą
$playlistIdToDelete = $_POST['playlistId']; // Šią reikšmę siųsime iš Flutter aplikacijos
deletePlaylistUser($playlistIdToDelete);

$conn->close();
?>
