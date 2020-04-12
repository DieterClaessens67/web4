package db;

import domain.Message;

import java.util.ArrayList;
import java.util.List;

public class MessageRepositoryStub implements MessageRepository {
    private List<Message> messageList;

    public MessageRepositoryStub() {
        messageList = new ArrayList<>();
    }

    @Override
    public void addMessage(Message message){
        this.messageList.add(message);
    }

    @Override
    public List<Message> messagesForChat(String userId){
        List<Message> result = new ArrayList();
        for(Message message:getAllMessages()){
            if(message.getRecipientId().equalsIgnoreCase(userId) || message.getSenderId().equalsIgnoreCase(userId)){
                result.add(message);
            }
        }
        return result;
    }

    private List<Message> getAllMessages(){
        return this.messageList;
    }
}
