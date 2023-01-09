n = []
for i in range(1,6):
    if i <= 2:
        n.append(i - 1)

print(n)
n1 = [i-1 for i in range(1,6) if i<=2]
print(n1)


trips = {1,2,3}
print(len(trips))