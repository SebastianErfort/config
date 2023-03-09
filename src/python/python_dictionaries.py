#!/usr/bin/python3

# find item with max/min value for certain key in list of dictionaries with common key
prices = [{'name': 'apples', 'price': 1}, {'name': 'strawberries', 'price': 3}, {'name': 'watermelon', 'price': 5}]
print("prices:",prices)
print(f"highest price: {max(prices, key=lambda x:x['price'])}")
print(f"lowest price: {min(prices, key=lambda x:x['price'])}")
