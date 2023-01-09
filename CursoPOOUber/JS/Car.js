class Car{
    constructor(license, driver, passenger){
        this.id;
        this.license = license;
        this.driver = driver;
        this.passenger = passenger;
    }

    printCarData = () => {
        console.log("License: " + this.license + " Driver: " + this.driver.name)
    }
}