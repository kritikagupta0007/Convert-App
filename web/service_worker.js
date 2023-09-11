importScripts('https://storage.googleapis.com/workbox-cdn/releases/5.1.2/workbox-sw.js');

workbox.setConfig({ debug: false });

workbox.core.skipWaiting();
workbox.core.clientsClaim();

workbox.routing.registerRoute(
  /\.(?:html|js|css)$/,
  new workbox.strategies.StaleWhileRevalidate({
    cacheName: 'my-cache',
  })
);

self.addEventListener('install', (event) => {
    self.skipWaiting();
    event.waitUntil(
      caches.open('my-cache').then((cache) => {
        return cache.addAll([
          // Add URLs of assets to be cached
          './index.html',
          './datepicker/datepicker.html',
          './typescript/typescript.html',
          './main.dart.js',
        //   '/web/firebase-messaging-sw.js',
          './assets/assets/image_1.svg',
          './assets/assets/image_2.svg',
          './assets/assets/lottie/swap_lottie.json',
        //   'web/icons/',
          './favicon.png'
        ]);
      })
    );
  });

  self.addEventListener('activate', function(event) {
    event.waitUntil(
      caches.keys().then(function(keys) {
        return Promise.all(keys.map(function(key) {
          if (key !== 'my-cache') {
            return caches.delete(key);
          }
        }));
      })
    );
  });
  
  
  // self.addEventListener('fetch', (event) => {
  //   const url = event.request.url;
  //   if (url.includes('/web/datepicker.html')) {
  //     event.respondWith(fetch(url));
  //   } else {
  //     event.respondWith(
  //       caches.match(event.request).then((response) => {
  //         return response || fetch(event.request);
  //       })
  //     );
  //   }
  // });
  
  