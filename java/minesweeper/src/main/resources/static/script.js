function testBackend() {

    fetch("/api/test")
        .then(response => response.text())
        .then(data => {
            document.getElementById("result").innerText = data;
        });

}