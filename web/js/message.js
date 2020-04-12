$('#sendButton').on("click",sendMessage);
$(window).on("load",getMessages);

let xHRObject3 = new XMLHttpRequest();
let xHRObject4 = new XMLHttpRequest();
let $messagesStuff = $('#messages');
let $chatRecip = $('#chatRecipient');

function sendMessage() {
    let $messageText = $('#msg').val();
    let $recipientId = $chatRecip.val();
    xHRObject3.open("POST","Controller?action=Message&message="+$messageText+"&recipient="+$recipientId, true);
    xHRObject3.send(null);
}

function getMessages() {
    xHRObject4.open("GET", "Controller?action=GetMessages",true);
    xHRObject4.onreadystatechange = getData2;
    xHRObject4.send(null);
}

function getData2() {
    if (xHRObject4.status === 200) {
        if (xHRObject4.readyState === 4) {
            let jsonResponse = JSON.parse(xHRObject4.responseText);
            let $senderIdStuff = $('#sessionStuff').text();
            let $recipient = $chatRecip.val();
            $messagesStuff.empty();
            for (let message in jsonResponse) {
                if ((jsonResponse[message].recipientId === $senderIdStuff || $senderIdStuff === jsonResponse[message].senderId) &&
                    (jsonResponse[message].recipientId === $recipient || jsonResponse[message].senderId === $recipient)) {
                    let messageLine = document.createElement('p');
                    let sender = document.createTextNode(jsonResponse[message].sender +": ");
                    let messageLineText = document.createTextNode(jsonResponse[message].message);
                    messageLine.appendChild(sender);
                    messageLine.appendChild(messageLineText);
                    $messagesStuff.append(messageLine);
                }
            }
            setInterval(getMessages,5000);
        }
    }
}

$chatRecip.on('change', function(){
    getData2()});
