# change Text Replacement



```
    cpm install -g DBD::SQLite
```


# first dumpText Replacement DB

```
  perl dump-macos.pl > text-replace.txt
```

# fix it

```
  vi text-replace.txt
```

# update

```
   perl insert-text-replacement-db.pl text-replace.txt
```

cf. this will remove everything and insert
