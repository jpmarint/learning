class Person {
    constructor(name){
        this.name = name;
    }
    walk(this) {
        console.log("Walking!");
    }
}