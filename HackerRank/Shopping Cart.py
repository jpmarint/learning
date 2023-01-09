#!/bin/python3

import math
import os
import random
import re
import sys



class Item:
    def __init__(self, name, price):
        self.price = price
        self.name = name


class ShoppingCart:
    cart_names = []
    cart_prices = []
    totalPrice = 0
    
    def __init__(self):
        super().__init__()
    
    def add(self, item):
        self.cart_names.append(item.name)
        self.cart_prices.append(item.price)
    
    def __len__(self):
        return len(self.cart_names)
        
    def total(self):
        self.totalPrice = sum(self.cart_prices)
        return self.totalPrice
   

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    n = int(input())
    items = []
    for _ in range(n):
        name, price = input().split()
        item = Item(name, int(price))
        items.append(item)

    cart = ShoppingCart()

    q = int(input())
    for _ in range(q):
        line = input().split()
        command, params = line[0], line[1:]
        if command == "len":
            fptr.write(str(len(cart)) + "\n")
        elif command == "total":
            fptr.write(str(cart.total()) + "\n")
        elif command == "add":
            name = params[0]
            item = next(item for item in items if item.name == name)
            cart.add(item)
        else:
            raise ValueError("Unknown command %s" % command)
            
    fptr.close()
