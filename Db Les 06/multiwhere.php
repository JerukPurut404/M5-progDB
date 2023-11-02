<?php error_reporting(E_ALL ^ E_NOTICE);
require_once "dbdata.php";
$search = $_GET["search"];
$conn = new mysqli(
    $envSettings["DB_HOST"],
    $envSettings["DB_USER"],
    $envSettings["DB_PASSWORD"],
    $envSettings["DB_NAME"]
);
if (!$conn) {
    die("Databaseverbinding mislukt: " . mysqli_connect_error());
}
$query = "SELECT * FROM leerlingen WHERE naam = ?";
$stmt = mysqli_prepare($conn, $query);
mysqli_stmt_bind_param($stmt, "s", $search);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);
if ($result) {
    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
            echo "Leerling: " . $row["naam"] . "<br>";
            echo "Leeftijd: " . $row["leeftijd"] . "<br>";
        }
    } else {
        echo "No results found.";
    }
} else {
    echo "Query fout: " . mysqli_error($conn);
}
mysqli_close($conn);
?>
