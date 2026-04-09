document.addEventListener("DOMContentLoaded", function () {

    const inputs = document.querySelectorAll(".form-control");

    inputs.forEach(input => {

        input.addEventListener("blur", function () {

            let isValid = true;

            const validators = input.parentElement.querySelectorAll(".validator");

            validators.forEach(v => {
                if (v.innerText.trim() !== "") {
                    v.classList.add("active");
                    isValid = false;
                } else {
                    v.classList.remove("active");
                }
            });

            if (input.value.trim() === "") {
                isValid = false;
            }

            input.classList.remove("is-valid", "is-invalid");

            if (isValid) {
                input.classList.add("is-valid");
            } else {
                input.classList.add("is-invalid");
            }

        });

    });

});