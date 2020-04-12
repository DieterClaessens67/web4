const xHRObject1 = new XMLHttpRequest();
window.addEventListener("load",getFriends);

let friendListTable = document.getElementById("friendList");
let chatRecipient = document.getElementById("chatRecipient");

function getFriends() {
    let url1 = "Controller?action=GetFriends";
    xHRObject1.open("GET",url1,true);
    xHRObject1.onreadystatechange = getData1;
    xHRObject1.send(null);
}


function getData1() {
    if (xHRObject1.status == 200) {
        if (xHRObject1.readyState == 4) {
            let serverResponse = xHRObject1.responseText;
            let jsonResponse = JSON.parse(serverResponse);
            let selectedPrevious = document.getElementById("chatRecipient").value;
            clearFriends();
            for (let friend in jsonResponse){
                let newRow = friendListTable.insertRow();   //Voegt een tr toe aan de tabel
                let newCell = newRow.insertCell();          //voegt een td toe aan de tr in de tabel
                let firstName = document.createTextNode(jsonResponse[friend].userName);   //Maakt nieuwe tekst
                newCell.appendChild(firstName);               //Voegt text in in de cell
                let cell = newRow.insertCell();
                let status = document.createTextNode(jsonResponse[friend].status);
                cell.appendChild(status);
                let option = document.createElement('option');
                option.appendChild(document.createTextNode(jsonResponse[friend].userName));
                option.value = friend;
                chatRecipient.appendChild(option);
                if(friend === selectedPrevious){
                    chatRecipient.value= selectedPrevious;
                }
            }
            setInterval(getFriends,10000);
        }
    }
}

function clearFriends() {
    while (friendListTable.firstChild) {
        friendListTable.removeChild(friendListTable.lastChild);
    }
    while (chatRecipient.firstChild){
        chatRecipient.removeChild(chatRecipient.lastChild);
    }
}