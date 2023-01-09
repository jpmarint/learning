const Person = function(firstAndLast) {
  // Only change code below this line
  // Complete the method below and implement the others similarly
  this.getFullName = function() {
    return firstAndLast;
  };
  this.getFirstName = function() {
    return firstAndLast.split(" ")[0];
  };
  this.getLastName = function() {
    return firstAndLast.split(" ")[1];
  };
  this.setFirstName = function(firstName) {
    firstAndLast = firstName +" "+ this.getLastName();
  };
  this.setLastName = function(lastName) {
    firstAndLast = this.getFirstName() + " " + lastName;
  };
  this.setFullName = function(fullName){
    firstAndLast = fullName;
  }
};

const bob = new Person('Bob Ross');
bob.getFullName();