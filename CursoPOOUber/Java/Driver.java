package Java;

public class Driver extends Account{

    public Driver(String name, String document, String email, String password) {
        super(name, document);
        super.email = email;
        super.password = password;
    }
    
    void printDriverData(){
        System.out.println("Document driver: " + document + " Name driver: " + name + " E-mail: " + email + " Password: " + password);
    }
}
