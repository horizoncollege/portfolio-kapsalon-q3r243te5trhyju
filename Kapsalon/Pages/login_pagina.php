<!DOCTYPE html>
<html lang="en">
    <?php include 'templates/head.php'; ?>
<body>

    <?php include 'templates/navbar.html'; ?>

    <div class="container text-dark mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="text-center mb-4">Inloggen</h2>

                <!-- Algemene foutmelding -->
                <div id="loginError" class="alert alert-danger d-none" role="alert"></div>
                
                <form action="login/login.php" method="post" class="p-4 rounded" id="loginForm">
                    <div class="form-group mb-3">
                        <label for="gebruikersnaam">Gebruikersnaam of E-mail:</label>
                        <input type="text" class="form-control" id="gebruikersnaam" name="gebruikersnaam" required>
                        <div id="emailError" class="text-danger d-none"></div> <!-- Specifieke foutmelding voor e-mail -->
                    </div>

                    <div class="form-group mb-4">
                        <label for="wachtwoord">Wachtwoord:</label>
                        <input type="password" class="form-control" id="wachtwoord" name="wachtwoord" required>
                        <div id="passwordError" class="text-danger d-none"></div> <!-- Specifieke foutmelding voor wachtwoord -->
                    </div>

                    <button type="submit" class="btn btn-dark w-100">Inloggen</button>
                </form>
            </div>
        </div>
    </div>

    <?php include 'templates/footer.html'; ?>
    <script src="../Javascript/error_messages.js"></script>

