<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "mellowde";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Prisijungimo klaida: " . $conn->connect_error);
}

function createPlaylist($name, $description, $imageUrl, $userId) {
    global $conn;

    // Įterpiame naują įrašą į `playlist` lentelę
    $query = "INSERT INTO playlist (name, description, imageUrl, userId) VALUES ('$name', '$description', '$imageUrl', '$userId')";

    if ($conn->query($query) === TRUE) {
        echo "Playlistas sukurtas sėkmingai.";

        // Gauti naujai sukurtą playlist'o ID
        $playlistId = $conn->insert_id;

        // Įterpiame naują įrašą į `playlistuser` lentelę
        $queryPlaylistUser = "INSERT INTO playlistuser (userRole, playlistId, userId) VALUES ('user', '$playlistId', '$userId')";

        if ($conn->query($queryPlaylistUser) === TRUE) {
            echo "Playlisto naudotojas sukurtas sėkmingai.";
        } else {
            echo "Klaida įdedant į playlistuser lentelę: " . $conn->error;
        }

        // ... galite pridėti kitus veiksmus, pvz., įkelti nuotrauką ir gauti jos URL
    } else {
        echo "Klaida įdedant į playlist lentelę: " . $conn->error;
    }
}


// Pavyzdinė užklausa su post duomenimis
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $target_dir = "images/";  // Directory where images will be stored
    $target_file = $target_dir . basename($_FILES["file"]["name"]);
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

    $name = $_POST["name"];
    $description = $_POST["description"];
    $imageUrl = "http://10.0.2.2/" . $target_file;
    $userId = 52; // Pakeiskite į jūsų vartotojo ID

    createPlaylist($name, $description, $imageUrl, $userId);
}

$conn->close();
?>
