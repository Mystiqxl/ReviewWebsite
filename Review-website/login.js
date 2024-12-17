document.getElementById('loginform').addEventListener('submit', function(event) {
    event.preventDefault();  // Prevent the default form submission

    const username = document.getElementById('Username').value;
    const password = document.getElementById('Password').value;

    // Send the POST request via fetch
    fetch('/login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'  // This is the content type for form data
        },
        body: new URLSearchParams({
            'username': username,
            'password': password
        })
    })
    .then(response => response.text())  // Get the response as plain text
    .then(data => {
        document.getElementById('result').innerHTML = data;  // Show the response message from Flask
        
    })
    .catch(error => {
        console.error('Error occurred:', error);
        document.getElementById('result').innerText = 'An error occurred: ' + error;
    });
});
