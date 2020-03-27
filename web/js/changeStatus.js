let changeStatusButton = document.getElementById("changeStatus");
changeStatusButton.addEventListener("click",changeStatus);

let xHRObject = new XMLHttpRequest();

function changeStatus() {
    let newStatus = document.getElementById("stat").value;
    let url = "Controller?action=ChangeStatus&status=".concat(newStatus);
    xHRObject.open("POST", url, true);
    xHRObject.onreadystatechange = getData;
    xHRObject.send(null);
}

function getData() {
    if (xHRObject.status == 200) {
        if (xHRObject.readyState == 4) {
            console.log(xHRObject.responseText);
            let serverResponse = xHRObject.responseText;
            let oldStatus = document.getElementById('status');
            oldStatus.innerText = 'Status: ' + serverResponse;
        }
    }
}


