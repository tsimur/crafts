# Terminal cheat sheet
This cheat sheet ontain original solutions for terminal work, wich was not which were not obvious before I discovered them for myself.
## Copy file from other folder to current folder
```bash
cp ~/Desktop/swop.sh .
```
## Create folder and go in to it by ```$_```
```$_``` is a special parameter that holds the last argument of the previous command. The quote around $_ make sure it works even if the folder name contains spaces.
```bash
mkdir ../notes && cd "$_"
```
###### to be continued
