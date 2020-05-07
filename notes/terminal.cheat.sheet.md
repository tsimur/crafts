# Terminal notes
These notes contain examples of working with the terminal that I found useful for myself.
## Copy file from other folder to current folder
```bash
cp ~/Desktop/swop.sh .
```
## Create folder and go in to it by ```$_```
```$_``` is a special parameter that holds the last argument of the previous command. The quote around $_ make sure it works even if the folder name contains spaces.
```bash
mkdir ../notes && cd "$_"
```
## Another user folder
To access another user's folder, you can use the following expression. This is especially convenient when the location of the user's folder is unknown.

```bash
cd ~jenkins/
```

## Сall сommand by number from the terminal history without executing.
Use the up arrow key to edit command before use.

```bash
$ !1581:p
```

```
bash: P: unrecognized history modifier
```
###### to be continued
