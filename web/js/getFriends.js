const xHRObject1 = new XMLHttpRequest();
window.addEventListener("load",getFriends);



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
            let friendListTable = document.getElementById("friendList");
            clearFriends();
            for (let friend in jsonResponse){
                let newRow = friendListTable.insertRow();   //Voegt een tr toe aan de tabel
                let newCell = newRow.insertCell();          //voegt een cell toe aan de tr in de tabel
                let firstName = document.createTextNode(jsonResponse[friend].userName);   //Maakt nieuwe tekst
                newCell.appendChild(firstName);               //Voegt text in in de cell
                let cell = newRow.insertCell();
                let status = document.createTextNode(jsonResponse[friend].status);
                cell.appendChild(status);
            }
            setInterval(getFriends,10000);
        }
    }
}

function clearFriends() {
    let friendListTable1 = document.getElementById("friendList");
    while (friendListTable1.firstChild) {
        friendListTable1.removeChild(friendListTable1.lastChild);
    }
}