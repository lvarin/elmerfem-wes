# ELMER WES

Simple wrapper `Dockerfile` to add the zip and unzip tools and an entrypoint:

```Dockerfile
FROM lvarin/elmerfem:20210413

RUN sudo apt install -y unzip zip

COPY entrypoint.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
```

The entrypoint just unzips the file provided in the workflow input, and then finds and executes the first file called `job.sh`. More checks and logging should be added, this is just a beta.

```
#!/bin/bash

FILE=$1

if [[ -z $FILE || ! -f $FILE ]];
then
  echo "ERROR: ($FILE) File not found" >&2
  exit 1
fi

unzip $FILE

find . -maxdepth 4 -name job.sh -exec {} \;
```


