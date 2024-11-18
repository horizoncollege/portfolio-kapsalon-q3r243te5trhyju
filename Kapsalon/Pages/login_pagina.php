<!DOCTYPE html>
<html lang="en">
    <?php include 'templates/head.php'; ?>
<body>

    <?php include 'templates/navbar.html'; ?>

    <div class="container text-dark mt-5 mb-5">
        <div class="row justify-content-center">
            <div class="col-md-6 mt-4">
                <!-- Login Form Container -->
                <div class="card shadow-sm p-4">
                    <h2 class="text-center mb-4">Log in</h2>

                    <div class="containter">

                    <!-- Login Form -->
                    <form action="login/login.php" method="post" id="loginForm">
                        <div class="form-group mb-3">
                            <label for="gebruikersnaam">Email address or username</label>
                            <input type="text" class="form-control custom-focus" id="gebruikersnaam" name="gebruikersnaam" required>
                        </div>

                        <div class="form-group mb-3">
                            <label for="wachtwoord">Password</label>
                            <div class="input-group">
                                <input type="password" class="form-control custom-focus" id="wachtwoord" name="wachtwoord" required>
                                <button type="button" class="btn btn-outline-secondary" id="togglePassword">
                                    <i class="bi bi-eye-slash"></i>
                                </button>
                            </div>
                        </div>

                        <div class="form-check mb-3">
                            <input type="checkbox" class="form-check-input custom-focus" id="rememberMe">
                            <label class="form-check-label" for="rememberMe">Remember me</label>
                        </div>

                        <button type="submit" class="btn btn-dark w-100 mb-3">Log in</button>

                        <p class="text-center mb-2">
                            <a href="#" class="text-decoration-none">Forgot your password?</a>
                        </p>

                        <p class="text-center">
                            Don’t have an account? <a href="signup.php" class="text-decoration-none">Sign up</a>
                        </p>
                    </form>

                    </div>

                    <!-- Divider -->
                    <div class="text-center my-3">
                        <span class="text-muted">Or continue with</span>
                        <hr class="w-50 mx-auto">
                    </div>

                    <!-- Social Login Buttons -->
                    <div class="d-flex justify-content-center gap-3">
                        <a href="#" class="btn btn-outline-secondary rounded-circle">
                            <i class="bi bi-facebook"></i>
                        </a>
                        <a href="#" class="btn btn-outline-secondary rounded-circle">
                            <i class="bi bi-apple"></i>
                        </a>
                        <a href="#" class="btn btn-outline-secondary rounded-circle">
                            <i class="bi bi-google"></i>
                        </a>
                        <a href="#" class="btn btn-outline-secondary rounded-circle">
                            <i class="bi bi-twitter"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <?php include 'templates/footer.html'; ?>
</body>
</html>
