let commentSection = document.getElementById("comments");
let websocket;
let commentButton = document.getElementById("commentButton");
commentButton.addEventListener("click",comment);
window.addEventListener("load",openSocket);
window.addEventListener("close",closeSocket);

function comment() {
    send();
}

function openSocket() {
    websocket = new WebSocket("ws://localhost:8080/echo");
    websocket.onmessage = function(event){
        writeResponse(event.data);
    };
}

function writeResponse(text){
    commentSection.innerHTML += "<br/>" + text;
}

function send(){
    let name = document.getElementById("name").value;
    let comment = document.getElementById("comment").value;
    let score = document.getElementById("score").value;
    let text = name+": "+comment+" "+score;
    websocket.send(text);
}

function closeSocket(){
    websocket.close();
}
