// validation.js

function validateEmail(email) {
    const re = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
    return re.test(String(email).toLowerCase());
}

function validatePhone(phone) {
    const re = /^[0-9]{10}$/;
    return re.test(String(phone));
}

function validatePassword(password) {
    return password.length >= 6;
}

function matchPasswords(password, confirmPassword) {
    return password === confirmPassword;
}

function validateForm(form) {
    const email = form.email.value;
    const phone = form.phone.value;
    const password = form.password.value;
    const confirmPassword = form.reppassword.value;

    if (!validateEmail(email)) {
        alert("Invalid email address");
        return false;
    }
    if (!validatePhone(phone)) {
        alert("Invalid phone number format. Use 09998887766 format.");
        return false;
    }
    if (!validatePassword(password)) {
        alert("Password should be at least 6 characters long");
        return false;
    }
    if (!matchPasswords(password, confirmPassword)) {
        alert("Passwords do not match");
        return false;
    }
    return true;
}

function attachValidation(form) {
    form.onsubmit = function () {
        return validateForm(form);
    };
}
