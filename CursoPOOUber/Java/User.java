package Java;

public class User extends Account {

    public User(String name, String document, String email, String password) {
        super(name, document);
        super.email = email;
        super.password = password;
    }
    
    void printUserData(){
        System.out.println("Document user: " + document + " Name user: " + name + " E-mail: " + email + " Password: " + password);
    }
}
