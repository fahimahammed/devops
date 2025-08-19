# **Shell Scripting**
---

## **1. Introduction to Shell Scripting**

* **What is a Shell?**

  * A shell is a command-line interface (CLI) to interact with the operating system.
  * Common shells: `bash`, `zsh`, `sh`, `ksh`.

* **What is Shell Scripting?**

  * A shell script is a file containing a sequence of commands that the shell can execute.
  * Extension: `.sh` (commonly).

* **Creating a Shell Script**

```bash
touch hello.sh   # Create a new script file
vim hello.sh     # Open file for editing
```

* **Basic Script Structure**

```bash
#!/bin/bash        # Shebang: tells system which interpreter to use

echo "Hello World"
```

* **Making Script Executable**

```bash
chmod +x hello.sh    # Make script executable
./hello.sh           # Run script
```

---

## **2. File Permissions**

* **File permission format:** `-rwxr-xr-x`

  * First character: file type (`-` for file, `d` for directory)
  * Next 9 characters: permissions (owner/group/others)

* **Permission Symbols**

  | Symbol | Meaning |
  | ------ | ------- |
  | r      | read    |
  | w      | write   |
  | x      | execute |

* **Owner / Group / Others**

```text
-rwxr-xr-x
owner: rwx
group: r-x
others: r-x
```

* **Change Permissions**

```bash
chmod +x hello.sh   # Add execute permission
chmod 755 hello.sh  # Owner=7(rwx), Group=5(r-x), Others=5(r-x)
chmod 644 file.txt  # Owner=rw-, Group=r--, Others=r--
```

* **File Permission Cheatsheet**

| Octal | Permission | Meaning                         |
| ----- | ---------- | ------------------------------- |
| 777   | rwxrwxrwx  | All can read/write/execute      |
| 755   | rwxr-xr-x  | Owner full, others read/execute |
| 644   | rw-r--r--  | Owner read/write, others read   |
| 600   | rw-------  | Owner read/write only           |
| 400   | r--------  | Owner read only                 |

---

## **3. Variables**

* **Defining Variables**

```bash
name="Fahim"
age=25
```

* **Using Variables**

  ```bash
  echo "My name is $name and age is $age"
  ```

* **Special Variables**

  ```bash
  $0   # Script name
  $1   # First argument
  $#   # Number of arguments
  $@   # All arguments
  $?   # Exit status of last command
  $$   # PID of current script
  ```

---

## **4. Operators**

* **Arithmetic Operators**

```bash
a=10
b=5
echo $((a+b))   # 15
echo $((a-b))   # 5
echo $((a*b))   # 50
echo $((a/b))   # 2
echo $((a%b))   # 0
```

* **Comparison Operators**

```bash
[ $a -eq $b ]  # equal
[ $a -ne $b ]  # not equal
[ $a -gt $b ]  # greater than
[ $a -lt $b ]  # less than
[ $a -ge $b ]  # greater or equal
[ $a -le $b ]  # less or equal
```

* **Logical Operators**

```bash
[ $a -gt 5 ] && echo "a > 5"    # AND
[ $a -gt 5 ] || echo "a <= 5"   # OR
! [ $a -eq $b ]                  # NOT
```

---

## **5. Conditionals**

* **If Statement**

```bash
if [ $a -gt $b ]; then
  echo "a is greater"
elif [ $a -lt $b ]; then
  echo "b is greater"
else
  echo "Equal"
fi
```

* **Case Statement**

```bash
read -p "Enter a number: " num
case $num in
  1) echo "One";;
  2) echo "Two";;
  *) echo "Other";;
esac
```

---

## **6. Loops**

* **For Loop**

```bash
for i in {1..5}; do
  echo "Number $i"
done
```

* **While Loop**

```bash
count=1
while [ $count -le 5 ]; do
  echo $count
  ((count++))
done
```

* **Until Loop**

```bash
count=1
until [ $count -gt 5 ]; do
  echo $count
  ((count++))
done
```

---

## **7. Functions**

```bash
greet() {
  echo "Hello, $1"
}

greet "Fahim"
```

* **Returning Values**

```bash
sum() {
  echo $(($1 + $2))
}
result=$(sum 5 10)
echo $result   # 15
```

---

## **8. Arrays**

```bash
fruits=("apple" "banana" "cherry")
echo ${fruits[0]}    # apple
echo ${fruits[@]}    # all elements
echo ${#fruits[@]}   # length
```

* **Looping through arrays**

```bash
for fruit in "${fruits[@]}"; do
  echo $fruit
done
```

---

## **9. Input and Output**

* **Read input**

```bash
read -p "Enter your name: " name
echo "Hello $name"
```

* **Redirecting Output**

```bash
echo "Hello" > file.txt       # overwrite
echo "World" >> file.txt      # append
```

* **Redirecting Error**

```bash
ls /nonexistent 2> error.txt
```

---

## **10. File Operations**

* **Check if file/directory exists**

```bash
if [ -f file.txt ]; then
  echo "File exists"
fi

if [ -d /tmp ]; then
  echo "Directory exists"
fi
```

* **Read file line by line**

```bash
while IFS= read -r line; do
  echo $line
done < file.txt
```

---

## **11. Advanced Concepts**

* **Command Substitution**

```bash
current_date=$(date)
echo "Today is $current_date"
```

* **Pipes and Redirection**

```bash
ls -l | grep ".sh" > scripts.txt
```

* **Here Document**

```bash
cat <<EOF > file.txt
Hello
World
EOF
```

* **Trap Signals**

```bash
trap "echo Script interrupted; exit" SIGINT
```

* **Cron Jobs**

```bash
# run script every day at 5 PM
0 17 * * * /path/to/script.sh
```

* **Debugging Scripts**

```bash
bash -x script.sh   # Debug mode
```

---

## **12. Useful Tips**

* Always start script with `#!/bin/bash`.
* Use `chmod +x` to make scripts executable.
* Use functions to modularize code.
* Use comments `#` to explain your code.
* Test your script frequently.

---

## **13. File Permission Cheatsheet (Visual)**

```
Permission    Octal  Owner  Group  Others
---------     -----  -----  -----  ------
rwxrwxrwx     777    rwx    rwx    rwx
rwxr-xr-x     755    rwx    r-x    r-x
rw-r--r--     644    rw-    r--    r--
rw-------     600    rw-    ---    ---
r--------     400    r--    ---    ---
```

**Quick Reference Diagram:**

```
Position:  -  rwx rwx rwx
           |  |   |   |
           |  |   |   └── Others
           |  |   └────── Group
           |  └────────── Owner
           └──────────── File type (-, d)
```

