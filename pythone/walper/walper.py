import os
import wget
from datetime import datetime



def generate_image_url(resolution_w=1920, resolution_h=1080, search_keywords='city,bus'):
    download_url = "https://source.unsplash.com/" + str(resolution_w) + 'x' + str(resolution_h) + '/?' + search_keywords
    return download_url


def save_path_generate(keywords='city,bus', folder_path='/home/tsimur/testpyd/'):
    now = datetime.now()
    current_time = now.strftime("%H-%M-%S")
    current_date = now.date()
    file_name = folder_path + keywords.replace(",", "-") + '-' + str(current_date) + '-' + str(current_time) + '.jpg'
    return file_name


def download_image(url, path):
    wget.download(url, path)


def set_walper(path_to_image):
    command = 'gsettings set org.gnome.desktop.background picture-uri file:' + path_to_image
    os.system(command)



keywords = 'forest,lake'
image_path = save_path_generate(keywords)
download_image(generate_image_url(1920, 1080, keywords), image_path), set_walper(image_path)