let $chatForm = $('#chatForm');
$('#open-button').on("click",function showChatBox() {
    $chatForm.show();
});

$('#closeChatBox').on("click",closeChatBox);

function closeChatBox() {
    $('#chatForm').hide();
}