#------------- map ------------------

# multiplicar por 2 elementos de una lista
numbers = [1, 2, 3, 4]
numbers2 = []

for i in numbers:
  numbers2.append(i*2)
  
print(numbers2)
#[2, 4, 6, 8]

# multiplicar por 2 elementos de una lista con map
numbers3 = list(map(lambda i: i*2, numbers))
print(numbers3)
# [2, 4, 6, 8]

# iterar dos listas y aplicar una transformacion con map
numbers_1 = [3, 4, 5, 6]
numbers_2 = [7, 8, 9]

result = list(map(lambda x, y: x + y, numbers_1, numbers_2))
print(result)
#[10, 12, 14]