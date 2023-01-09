package Java;

public class Main {
    public static void main(String[] args) {
        System.out.println("Hola Juan");
        Car car = new Car("MWR244", new Account("Juan Pablo Marin", "1144211562"));
        car.printDataCar();

        Car car2 = new Car("QWE567", new Account("Andrea Herrera", "16626895"));
        car2.printDataCar();
    }
}
