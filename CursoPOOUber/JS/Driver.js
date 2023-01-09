class Driver extends Account{
    constructor(name, document, email, password){
        super(name, document, email, password)
    }

    printDataDriver() {
        console.log("Driver Name: " + this.name + " Driver document: " + this.document + " Driver email: " + this.email + " Driver password: " + this.password);
    }
}