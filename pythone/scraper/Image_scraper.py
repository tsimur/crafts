# This is Parser blank
from bs4 import BeautifulSoup
import requests
import urllib.request
import os

directory = './img/'

if not os.path.exists(directory):
    os.makedirs(directory)

for page in range(1): # if necessery grabb several page on site
    page = requests.get("site address" + str(page)) # put this url instead text "site address", quotation marks must be remain
    soup = BeautifulSoup(page.content, 'html.parser')
    #print(soup.find_all('img'))
    images = list(soup.find_all('img'))
    for img in images:
        link = img.get('src')
        if link.startswith('https://'): # Link filter
            file_name = os.path.basename(link)
            try:
                urllib.request.urlretrieve(link, directory + file_name)
            except:
                print("Something bad happened")

            print(link)
