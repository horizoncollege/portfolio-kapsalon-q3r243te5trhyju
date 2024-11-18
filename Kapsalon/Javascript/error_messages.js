document.addEventListener('DOMContentLoaded', function () {
    // Selecteer het loginformulier
    const loginForm = document.querySelector('#loginForm');

    // Selecteer foutmeldingsvelden
    const emailError = document.querySelector('#emailError');
    const passwordError = document.querySelector('#passwordError');
    const generalError = document.querySelector('#loginError');

    // Inlogfunctie
    if (loginForm) {
        loginForm.addEventListener('submit', function (e) {
            e.preventDefault();
            handleFormSubmit(loginForm, 'login/login.php');
        });
    }

    // Algemene functie voor het afhandelen van formulierinzending
    function handleFormSubmit(form, url) {
        // Clear vorige foutmeldingen
        [emailError, passwordError, generalError].forEach(el => el && el.classList.add('d-none'));

        // Verzamel formulierdata
        const formData = new FormData(form);

        // AJAX-verzoek verzenden
        fetch(url, {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                // Bij succesvolle inlog, redirecten naar de juiste pagina
                window.location.href = data.redirect;
            } else {
                // Specifieke foutmeldingen tonen
                if (data.emailError) {
                    emailError.textContent = data.emailError;
                    emailError.classList.remove('d-none');
                }

                if (data.passwordError) {
                    passwordError.textContent = data.passwordError;
                    passwordError.classList.remove('d-none');
                }

                if (data.generalError) {
                    generalError.textContent = data.generalError;
                    generalError.classList.remove('d-none');
                }
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
    }
});
