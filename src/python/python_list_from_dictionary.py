#!/usr/bin/python3
def list_items_in_dict(d: dict, dict_listname, key, value, return_key):
  '''
  Select values of key return_ket in list of dictionaries dict_listname in dictionary d where a key
  has a certain value.
  '''
  return [i[return_key] for i in d[dict_listname] if i[key] == value]

# Example
d = {'name': 'inventory',
  'items': [
    {'name': 'apples',       'type': 'fruit', 'number': 5},
    {'name': 'strawberries', 'type': 'fruit', 'number': 20},
    {'name': 'courgette',    'type': 'vegetable', 'number': 2},
    {'name': 'almonds',      'type': 'nut',   'number': 7}
  ]
}
l = list_items_in_dict(d, 'items', 'type', 'fruit', 'name')
print(l)
l = list_items_in_dict(d, 'items', 'type', 'nut', 'name')
print(l)

