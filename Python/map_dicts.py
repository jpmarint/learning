items = [
    {
        'product': 'camisa',
        'price': 100
    },
    {
        'product': 'pantalones',
        'price': 300
    },
    {
        'product': 'zapatos',
        'price': 200
    }
]

prices =  list(map(lambda item: item['price'], items))
print(prices)

def add_taxes(item):
    new_item = item.copy()
    new_item['tax'] = new_item['price']*0.19
    return new_item

new_items = list(map(add_taxes, items))
print(new_items)
print("///////////////////////////////")
print(items)
