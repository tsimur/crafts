import requests
number = 0
while number in range(10):
    img_data = requests.get('<link-without-filename>' + str(number) + '.jpg').content
    with open(str(number) + '.jpg', 'wb') as handler:
        handler.write(img_data)
    number += 1
