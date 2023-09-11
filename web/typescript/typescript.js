"use strict";
// TypeScript code
function encrypt() {
    const button = document.createElement("button");
    button.textContent = "Click Me"; // Set the button text
    button.className = "my-button"; // Add a CSS class for styling
    // Add a click event listener to the button
    button.addEventListener("click", () => {
        // const salt = "salt";
        // const text = "Hello";
        // const encryptedText = crypt(salt, text);
        // console.log(encryptedText);
        alert('button clicked');
    });
    document.body.appendChild(button);
}
function crypt(salt, text) {
    const textToChars = (text) => text.split("").map((c) => c.charCodeAt(0));
    const byteHex = (n) => ("0" + Number(n).toString(16)).substr(-2);
    const applySaltToChar = (code, saltChars) => saltChars.reduce((a, b) => a ^ b, code);
    const saltChars = textToChars(salt);
    const data = text
        .split("")
        .map((char, index) => applySaltToChar(char.charCodeAt(0), saltChars))
        .map(byteHex)
        .join("");
    return data;
}
// document.addEventListener("DOMContentLoaded", function () {
// });
document.addEventListener("DOMContentLoaded", function () {
  encrypt();
});
