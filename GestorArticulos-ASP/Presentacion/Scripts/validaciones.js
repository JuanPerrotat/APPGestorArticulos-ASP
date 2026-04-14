function validarInput(input) {
    const container = input.closest(".form-group");
    const errorDiv = container.querySelector(".invalid-feedback");

    if (!input.checkValidity()) {
        input.classList.add("is-invalid");
        input.classList.remove("is-valid");

        if (input.value.trim() === "") {
            errorDiv.textContent = "El campo es obligatorio";
        } else {
            errorDiv.textContent = "Formato inválido";
        }

        return false;
    } else {
        input.classList.remove("is-invalid");
        input.classList.add("is-valid");
        errorDiv.textContent = "";
        return true;
    }
}

function validarFormulario() {
    let valido = true;

    document.querySelectorAll(".form-control").forEach(input => {
        if (!validarInput(input)) {
            valido = false;
        }
    });

    return valido;
}

document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll(".form-control").forEach(input => {
        input.addEventListener("blur", function () {
            validarInput(this);
        });
    });
});