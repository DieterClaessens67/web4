package domain;

public class Message {
    private String message;
    private Person recipient;
    private Person sender;

    public Message(String message, Person recipient,Person sender) {
        setMessage(message);
        setRecipient(recipient);
        setSender(sender);
    }

    public String getRecipientId(){
        return getRecipient().getUserId();
    }

    public String getSenderId(){
        return getSender().getUserId();
    }

    public Person getRecipient() {
        return recipient;
    }

    private void setRecipient(Person recipient) {
        this.recipient = recipient;
    }

    public Person getSender() {
        return sender;
    }

    private void setSender(Person sender) {
        this.sender = sender;
    }

    public String getMessage() {
        return message;
    }

    private void setMessage(String message) {
        this.message = message;
    }

}
