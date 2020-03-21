package domain;

public enum UserStatus {
    ONLINE ("online"),
    OFFLINE ("offline"),
    AWAY ("away");

    private String description;

    UserStatus(String description){
        this.description = description;
    }

    UserStatus(){}

    public String getDescription(){
        return this.description;
    }
}
