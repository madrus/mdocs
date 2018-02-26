## How to make file executable

Suppose you have create a `run.sh` file and you want to be able to run it with `bash`. In the file, the first line should be like this:

```none
#!/bin/sh
```

or like this:

```none
#!/bin/bash
```

Then in the folder with your file run this command to add execute rights to the file:

```bash
chmod u+x ./run.sh
```

Finally, you can run this file like this:

```bash
./run.sh
```

---
