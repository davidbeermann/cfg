# Shell Scripting

## Conditional Statements

```shell
if [ -d "$FILE" ]; # FILE exists and is a directory
if [ -e "$FILE" ]; # FILE exists
if [ -f "$FILE" ]; # FILE exists and is a regular file
if [ -h "$FILE" ]; # FILE exists and is a symbolic link (same as -L)
if [ -L "$FILE" ]; # FILE exists and is a symbolic link (same as -h)
if [ -r "$FILE" ]; # FILE exists and read permission is granted
if [ -w "$FILE" ]; # FILE exists and write permission is granted
if [ -x "$FILE" ]; # FILE exists and execute (pr search) permission is granted
```

