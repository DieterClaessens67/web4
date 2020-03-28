let xHRObject2 = new XMLHttpRequest();
let addFriendButton = document.getElementById("addFriend");
addFriendButton.addEventListener("click",addFriend);

function addFriend() {
    let friendFirstName = document.getElementById("friendInput").value;
    let url2 = "Controller?action=AddFriend&firstName=".concat(friendFirstName);
    xHRObject2.open("POST", url2, true);
    xHRObject2.send(null);
}

