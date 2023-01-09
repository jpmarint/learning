def increment(x):
    return x+1

incrementV2 = lambda x : x+1

result = increment(10)
print(result)

result =  incrementV2(20)
print(result)

fullName = lambda firstName, lastName : f'Full name is: {firstName.title()} {lastName.title()}'

text = fullName("Juan", "Pablo")
print(text)