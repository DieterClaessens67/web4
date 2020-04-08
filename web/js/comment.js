let commentSection = document.getElementById("comments");
let commentSection1 = document.getElementById("comments1");
let commentSection2 = document.getElementById("comments2");
let commentSection3 = document.getElementById("comments3");
let commentSection4 = document.getElementById("comments4");

let websocket;

let commentButton = document.getElementById("commentButton");
let commentButton1 = document.getElementById("commentButton1");
let commentButton2 = document.getElementById("commentButton2");
let commentButton3 = document.getElementById("commentButton3");
let commentButton4 = document.getElementById("commentButton4");

commentButton.addEventListener("click",send);
commentButton1.addEventListener("click",send1);
commentButton2.addEventListener("click",send2);
commentButton3.addEventListener("click",send3);
commentButton4.addEventListener("click",send4);

window.addEventListener("load",openSocket);
window.addEventListener("close",closeSocket);


function openSocket() {
    websocket = new WebSocket("ws://localhost:8080/echo");
    websocket.onmessage = function(event){
        if(event.data.charAt(0) === '0') {
            let text = event.data.substring(1);
            writeResponse(text);
        }
        if(event.data.charAt(0) === '1'){
            writeResponse1(event.data.substring(1));
        }
        if(event.data.charAt(0) === '2'){
            writeResponse2(event.data.substring(1));
        }
        if(event.data.charAt(0)=== '3'){
            writeResponse3(event.data.substring(1));
        }
        if(event.data.charAt(0)==='4'){
            writeResponse4(event.data.substring(1));
        }
    };
}

function writeResponse(text){
    commentSection.innerHTML += "<br/>" + text;
}

function writeResponse1(text) {
    commentSection1.innerHTML += "<br/>" + text;
}

function writeResponse2(text) {
    commentSection2.innerHTML += "<br/>" + text;
}

function writeResponse3(text) {
    commentSection3.innerHTML += "<br/>" + text;
}

function writeResponse4(text) {
    commentSection4.innerHTML += "<br/>" + text;
}

function send(){
    let name = document.getElementById("name").value;
    let comment = document.getElementById("comment").value;
    let score = document.getElementById("score").value;
    let text = "0"+name+": "+comment+" "+score;
    websocket.send(text);
}

function send1() {
    let name1 = document.getElementById("name1").value;
    let comment1 = document.getElementById("comment1").value;
    let score1 = document.getElementById("score1").value;
    let text1 = "1"+name1+": "+comment1+" "+score1;
    websocket.send(text1);
}

function send2() {
    let name2 = document.getElementById("name2").value;
    let comment2 = document.getElementById("comment2").value;
    let score2 = document.getElementById("score2").value;
    let text2 = "2"+name2+": "+comment2+" "+score2;
    websocket.send(text2);
}

function send3() {
    let name3 = document.getElementById("name3").value;
    let comment3 = document.getElementById("comment3").value;
    let score3 = document.getElementById("score3").value;
    let text3 = "3"+name3+": "+comment3+" "+score3;
    websocket.send(text3);
}

function send4() {
    let name4 = document.getElementById("name4").value;
    let comment4 = document.getElementById("comment4").value;
    let score4 = document.getElementById("score4").value;
    let text4 = "4"+name4+": "+comment4+" "+score4;
    websocket.send(text4);
}

function closeSocket(){
    websocket.close();
}
