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
    $playlistId = $_POST["playlistId"];
    $name = $_POST["name"];
    $description = $_POST["description"];
    $imageUrl = $_POST["imageUrl"];

    // Pirmiausiai gauname esamą playlist'o įrašą
    $selectQuery = "SELECT * FROM playlist WHERE playlistId = '$playlistId'";
    $result = $conn->query($selectQuery);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        // Tikriname, kurie laukai buvo pakeisti, ir atnaujiname tik juos
        $name = empty($name) ? $row["name"] : $name;
        $description = empty($description) ? $row["description"] : $description;
        $imageUrl = empty($imageUrl) ? $row["imageUrl"] : $imageUrl;

        // Atnaujiname playlisto įrašą
        $updateQuery = "UPDATE playlist
                        SET name = '$name', description = '$description', imageUrl = '$imageUrl'
                        WHERE playlistId = '$playlistId'";

        if ($conn->query($updateQuery) === TRUE) {
            echo "Playlist atnaujintas sėkmingai.";
        } else {
            echo "Klaida: " . $conn->error;
        }
    } else {
        echo "Playlistas nerastas.";
    }
}

$conn->close();
?>
