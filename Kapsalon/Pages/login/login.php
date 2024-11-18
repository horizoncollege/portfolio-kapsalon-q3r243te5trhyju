<?php
require '../db_connect.php';

session_start();
header('Content-Type: application/json');

$response = ["success" => false];

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $gebruikersnaam_email = trim($_POST['gebruikersnaam']);
    $wachtwoord = trim($_POST['wachtwoord']);

    $sql = "SELECT gebruiker_id, gebruikersnaam, wachtwoord_hash, rol FROM gebruikers WHERE gebruikersnaam = ? OR email = ?";
    if ($stmt = $conn->prepare($sql)) {
        $stmt->bind_param("ss", $gebruikersnaam_email, $gebruikersnaam_email);
        $stmt->execute();
        $stmt->store_result();

        if ($stmt->num_rows == 1) {
            $stmt->bind_result($gebruiker_id, $gebruikersnaam, $hashed_wachtwoord, $rol);
            $stmt->fetch();

            if (password_verify($wachtwoord, $hashed_wachtwoord)) {
                $_SESSION["gebruikers_id"] = $gebruiker_id;
                $_SESSION["gebruikersnaam"] = $gebruikersnaam;
                $_SESSION["rol"] = $rol;

                $response["success"] = true;
                $response["redirect"] = "./home.php";
            } else {
                $response["passwordError"] = "Het wachtwoord is onjuist. Probeer het opnieuw.";
            }
        } else {
            $response["emailError"] = "Er is geen account gevonden met deze gebruikersnaam of e-mailadres.";
        }
        $stmt->close();
    } else {
        $response["generalError"] = "Fout bij het voorbereiden van de query: " . $conn->error;
    }
    $conn->close();
} else {
    $response["generalError"] = "Ongeldig verzoek.";
}

echo json_encode($response);
?>