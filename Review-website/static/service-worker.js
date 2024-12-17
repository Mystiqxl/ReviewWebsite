const CACHE_NAME = 'my-cache-v1';
const CACHE_URLS = [
    '/',
    '/index.html',
    '/webstyle.css',
    '/script.js',
    '/images/logo.png',
    '/offline.html'
];

// Install Event - Cache files
self.addEventListener('install', event => {
    console.log('Service Worker installing...');
    event.waitUntil(
        caches.open(CACHE_NAME).then(cache => {
            console.log('Caching resources...');
            return cache.addAll(CACHE_URLS);
        })
    );
});

// Fetch Event - Serve cached content
self.addEventListener('fetch', event => {
    event.respondWith(
        caches.match(event.request).then(response => {
            return response || fetch(event.request).catch(() => {
                // If offline and the resource is not cached, show a fallback
                return caches.match('/offline.html');
            });
        })
    );
});

// Activate Event - Clean up old caches
self.addEventListener('activate', event => {
    console.log('Service Worker activating...');
    event.waitUntil(
        caches.keys().then(cacheNames => {
            return Promise.all(
                cacheNames.map(cache => {
                    if (cache !== CACHE_NAME) {
                        console.log('Deleting old cache:', cache);
                        return caches.delete(cache);
                    }
                })
            );
        })
    );
});
