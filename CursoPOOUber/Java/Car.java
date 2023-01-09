package Java;

public class Car {
    private Integer id;
    private String license;
    private Account driver;
    private Integer passenger;

    public Car(String license, Account driver){
        this.license =  license;
        this.driver = driver;
    }

    void printDataCar(){
        if (passenger != null){
           System.out.println("License: " +  license + " Driver: " + driver.name + " passengers: " + passenger); 
        }else{
            System.out.println("License: " +  license + " Driver: " + driver.name); 
        }
        
    }

    public Integer getPassenger(){
        return this.passenger;
    }

    public void setPassenger(Integer passenger){
        if(passenger == 4){
            this.passenger = passenger;
        }else {
            System.out.println("Add at least 4 passengers");
        }
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLicense() {
        return license;
    }

    public void setLicense(String license) {
        this.license = license;
    }

    public Account getDriver() {
        return driver;
    }

    public void setDriver(Account driver) {
        this.driver = driver;
    }


}
