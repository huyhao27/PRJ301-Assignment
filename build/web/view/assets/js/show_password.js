/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


document.addEventListener("DOMContentLoaded", function () {
    const toggle = document.getElementById("togglePassword");
    const password = document.getElementById("password");

    toggle.addEventListener("click", function () {
        const type = password.getAttribute("type") === "password" ? "text" : "password";
        password.setAttribute("type", type);

        // Đổi màu khi hiện/ẩn thay vì đổi icon
        this.style.color = type === "text" ? "gray" : "black";
    });
});
document.addEventListener("DOMContentLoaded", function () {
    const toggles = document.querySelectorAll(".toggle-password");

    toggles.forEach(function (toggle) {
        toggle.addEventListener("click", function () {
            const passwordInput = this.previousElementSibling;

            if (passwordInput && passwordInput.type === "password") {
                passwordInput.type = "text";
                this.style.color = "gray";
            } else {
                passwordInput.type = "password";
                this.style.color = "black";
            }
        });
    });
});
