from car import Car
from account import Account

if __name__ == "__main__":
    print("Hola mundo")
    car = Car("MWR244", Account("Juan Pablo Marin", "1144211562"))
    print(vars(car))
    print(vars(car.driver))