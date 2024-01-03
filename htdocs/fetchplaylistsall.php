<?php
// Duomenų bazės prisijungimas (pavyzdys)
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "mellowde";

// Sukurkite prisijungimą
$conn = new mysqli($servername, $username, $password, $dbname);

// Patikrinkite prisijungimą
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Užklausa gauti grojaraščius
$sql = "SELECT * FROM playlist";
$result = $conn->query($sql);

// Tikriname, ar yra rezultatų
if ($result->num_rows > 0) {
    // Sukuriame masyvą rezultatams saugoti
    $playlists = array();

    // Įtraukiame kiekvieną rezultatą į masyvą
    while($row = $result->fetch_assoc()) {
        $playlist = array(
            'playlistId' => $row['playlistId'],
            'name' => $row['name'],
            'description' => $row['description'],
            'imageUrl' => $row['imageUrl'],
            'userId' => $row['userId'],
        );
        array_push($playlists, $playlist);
    }

    // Konvertuojame masyvą į JSON formatą ir spausdiname
    echo json_encode($playlists);
} else {
    // Jei nėra rezultatų, išvedame tuščią masyvą
    echo json_encode(array());
}

// Uždarome prisijungimą
$conn->close();
?>
