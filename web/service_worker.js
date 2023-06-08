self.addEventListener('install', (event) => {
    self.skipWaiting();
    event.waitUntil(
      caches.open('my-cache').then((cache) => {
        return cache.addAll([
          // Add URLs of assets to be cached
          './index.html',
          './main.dart.js',
        //   '/web/firebase-messaging-sw.js',
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
  
  
  self.addEventListener('fetch', (event) => {
    event.respondWith(
      caches.match(event.request).then((response) => {
        return response || fetch(event.request);
      })
    );
  });
  