class User extends Account{
    constructor(name, document, email, password){
        super(name, document, email, password)
    }

    printDataUser() {
        console.log("User Name: " + this.name + " User document: " + this.document + " User email: " + this.email + " User password: " + this.password);
    }
}