# **Linux File Permission Cheatsheet**

## 1. **Permission Types**

* **r (read)**

  * File: Read file contents.
  * Directory: List directory contents.
* **w (write)**

  * File: Modify or delete file.
  * Directory: Create, delete, rename files inside.
* **x (execute)**

  * File: Execute as a program/script.
  * Directory: Access (cd into) directory.

---

## 2. **Permission Groups**

* **u** → user (owner)
* **g** → group
* **o** → others
* **a** → all (u+g+o)

---

## 3. **Symbolic Representation**

Example:

```
-rw-r--r--
```

* **-** : Regular file (first character = file type: `-` file, `d` directory, `l` link).
* **rw-** : Owner permissions (read + write).
* **r--** : Group permissions (read only).
* **r--** : Others permissions (read only).

---

## 4. **Octal Representation**

Each permission = number value:

* **r = 4, w = 2, x = 1**

| Permission | Octal Value |
| ---------- | ----------- |
| ---        | 0           |
| --x        | 1           |
| -w-        | 2           |
| -wx        | 3           |
| r--        | 4           |
| r-x        | 5           |
| rw-        | 6           |
| rwx        | 7           |

Example:

```
-rwxr-xr--
```

\= `754` (Owner=7, Group=5, Others=4)

---

## 5. **Common chmod Examples**

* `chmod 755 file` → `rwxr-xr-x`
* `chmod 644 file` → `rw-r--r--`
* `chmod 700 file` → `rwx------`
* `chmod u+x script.sh` → Add execute permission for owner.
* `chmod g-w file` → Remove write from group.

---

## 6. **Change Ownership**

* `chown user file` → Change owner.
* `chown user:group file` → Change owner & group.
* `chgrp group file` → Change only group.

---

## 7. **Special Permissions**

* **SetUID (s on user)**: File runs with owner’s privileges.

  * Example: `-rwsr-xr-x`
* **SetGID (s on group)**: File runs with group privileges / directories inherit group.

  * Example: `-rwxr-sr-x`
* **Sticky Bit (t on others)**: In directory, only owner can delete own files.

  * Example: `drwxrwxrwt` (`/tmp`).

---

## 8. **Quick Reference Table**

| Mode | Symbolic    | Octal | Meaning                            |
| ---- | ----------- | ----- | ---------------------------------- |
| 644  | `rw-r--r--` | 644   | Owner read/write, others read-only |
| 600  | `rw-------` | 600   | Owner read/write only              |
| 755  | `rwxr-xr-x` | 755   | Owner full, others read/execute    |
| 700  | `rwx------` | 700   | Owner full only                    |
| 777  | `rwxrwxrwx` | 777   | Everyone full access (not secure)  |
| 775  | `rwxrwxr-x` | 775   | Owner+group full, others read/exec |
| 444  | `r--r--r--` | 444   | Read-only for everyone             |
