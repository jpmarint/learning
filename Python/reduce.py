from functools import reduce

numbers = [1,2,3,4]

result =  reduce(lambda counter, item: counter + item, numbers)
print(result)