importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");

// const firebaseConfig = {
//     apiKey: "AIzaSyDHzkGsYIzqOyEIhz9lbypeZx_-3kEnZfg",
//     authDomain: "convert-app-f5b11.firebaseapp.com",
//     projectId: "convert-app-f5b11",
//     storageBucket: "convert-app-f5b11.appspot.com",
//     messagingSenderId: "593059135806",
//     appId: "1:593059135806:web:7fd641a684e805b19dac6f",
//     measurementId: "G-BF5RM6767P"
//   };

firebase.initializeApp({
  apiKey: "...",
  authDomain: "...",
  databaseURL: "...",
  projectId: "...",
  storageBucket: "...",
  messagingSenderId: "...",
  appId: "...",
});

const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});