# Search all files in folder with subfolders then resize and save in specify folder. It means that the files are images
# in the .jpeg format
import os
from PIL import Image
path = 'path to folder with subfolders'
dist = 'path to folder wherer you wont to save converted files'
dirs = [f for f in sorted(os.listdir(path))]
a = 0
size = 1024, 1024

for dir_name in dirs:
    current_dir = path + dir_name
    files = os.listdir(path=current_dir)
    for file in files:
        image = Image.open(current_dir + '/' + file)
        image.thumbnail(size)
        image.save(dist + dir_name + file, "JPEG")
        print(dist + dir_name + file)
