# DevOps & Linux Tasks Solutions

## Task 1: Log File Filtering

**Problem:**
Extract `ERROR` log lines from an application log file.

**Solution:**

1. **Create `app.log`** with sample log messages:

```text
2025-09-17 10:10:23 INFO User logged in
2025-09-18 10:11:05 ERROR Database connection failed
2025-09-19 10:11:45 DEBUG Cache refreshed
2025-09-19 10:12:10 ERROR Service unavailable
2025-09-19 10:13:00 INFO User requested dashboard
2025-09-19 10:13:30 DEBUG API response time: 120ms
2025-09-19 10:14:02 ERROR Payment gateway timeout
2025-09-19 10:15:10 INFO User logged out
2025-09-19 10:15:30 DEBUG Session cleared
2025-09-19 10:16:00 INFO Backup completed successfully
```

2. **Bash script `find_errors.sh`:**

[find_errors.sh](./task-1/find_errors.sh)

3. **Run the script:**

```bash
chmod +x find_errors.sh
./find_errors.sh
```

**Output:**

```text
2025-09-18 10:11:05 ERROR Database connection failed
2025-09-19 10:12:10 ERROR Service unavailable
2025-09-19 10:14:02 ERROR Payment gateway timeout
```

---

## Task 2: Linux File Permissions and Ownership

**Problem:**
Practice creating files, modifying permissions, and changing ownership.

**Solution Steps:**

1. **Create directory and file:**

```bash
mkdir project
echo "This is a sample note." > project/notes.txt
```

2. **Check default permissions:**

```bash
ls -l project/notes.txt
# Output might be: -rw-r--r--  1 fahimahammed  staff  23 Sep 19 20:41 project/notes.txt
```

3. **Modify file permissions:**

```bash
sudo chmod u-w project/notes.txt   # remove write permission for owner
sudo chmod u+x project/notes.txt   # add execute permission for owner
sudo chmod g-w project/notes.txt   # remove write permission for group 
```

4. **Change ownership to root:**

```bash
sudo chown root:staff project/notes.txt
```

5. **Verify final permissions:**

```bash
ls -l project/notes.txt
# Expected output:
-r-xr--r--  1 root  staff  22 Sep 19 20:48 project/notes.txt
```

---

## Task 3: Bash Script – Read and Print Email & Password

**Problem:**
Prompt user input for email and password, then display them.

**Solution:**

[read_credientials.sh](./task-3/read_credentials.sh)

**Explanation:**

* `read -p` prompts for input.
* `read -s` hides the input (useful for passwords).
* The script prints a confirmation with the entered email and password.

**Sample Run:**

```text
Enter your email: user@example.com
Enter your password: 
Your email is: user@example.com
Your password is: mysecretpassword
```

---
