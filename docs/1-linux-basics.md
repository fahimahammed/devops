# Linux Basics for DevOps – Complete Notes

## 1. Introduction to Linux

* Linux is an open-source, Unix-like operating system widely used in servers, cloud, and DevOps environments.
* Key advantages: stability, security, scalability, open-source, and strong community support.
* Almost all modern DevOps tools (Docker, Kubernetes, Jenkins, Ansible, Terraform) run primarily on Linux.

---

## 2. Linux File System Structure

* Hierarchical tree structure starting from root `/`.
* Important directories:

  * `/` : Root directory
  * `/bin` : Essential binary executables
  * `/sbin` : System binaries (admin commands)
  * `/etc` : Configuration files
  * `/home` : User home directories
  * `/var` : Logs, variable data
  * `/tmp` : Temporary files
  * `/usr` : User programs, libraries
  * `/opt` : Optional software
  * `/dev` : Device files
  * `/proc` : Process information

Command to view structure:

```bash
ls /
```

---

## 3. Basic Linux Commands

### File and Directory Operations

* `pwd` – Print working directory
* `ls` – List files
* `cd` – Change directory
* `mkdir` – Create directory
* `rmdir` – Remove directory
* `touch file` – Create empty file
* `cp src dest` – Copy file
* `mv src dest` – Move/rename file
* `rm file` – Remove file

### Viewing File Content

* `cat file` – View file contents
* `less file` – View content page by page
* `head -n 10 file` – First 10 lines
* `tail -n 10 file` – Last 10 lines
* `tail -f file` – View logs in real-time

---

## 4. User and Permission Management

### Users and Groups

* `whoami` – Show current user
* `id` – Display user and group IDs
* `adduser username` – Add user
* `passwd username` – Set/change password
* `deluser username` – Delete user

### File Permissions

* Represented as: `r` (read), `w` (write), `x` (execute).
* `ls -l` – View permissions. Example: `-rw-r--r--`

Changing permissions:

* `chmod 755 file` – Change permissions (numeric)
* `chmod u+x file` – Add execute permission to user (symbolic)

Changing ownership:

* `chown user file` – Change file owner
* `chgrp group file` – Change group

---

## 5. Process Management

* `ps` – List processes
* `ps aux` – Show all processes
* `top` – Real-time process monitoring
* `htop` – Enhanced process monitor
* `kill PID` – Kill process by PID
* `kill -9 PID` – Force kill

---

## 6. Package Management

### Debian-based (Ubuntu)

* `apt update` – Refresh package list
* `apt upgrade` – Upgrade packages
* `apt install package` – Install
* `apt remove package` – Remove

### RedHat-based (CentOS, Fedora)

* `yum update` – Update packages
* `yum install package` – Install
* `yum remove package` – Remove

---

## 7. Networking Basics

* `ifconfig` or `ip a` – Show network interfaces
* `ping host` – Test connectivity
* `curl url` – Fetch content from URL
* `wget url` – Download file from URL
* `netstat -tulnp` – Show open ports
* `ss -tulnp` – Alternative to netstat
* `scp file user@host:/path` – Secure copy file to remote server
* `ssh user@host` – Connect to remote server

---

## 8. Disk and File System Management

* `df -h` – Disk usage of file systems
* `du -sh dir/` – Disk usage of a directory
* `mount /dev/sdb1 /mnt` – Mount device
* `umount /mnt` – Unmount device
* `lsblk` – List block devices

---

## 9. Log Management

* Logs are usually stored in `/var/log`.
  Common logs:
* `/var/log/syslog` – System logs
* `/var/log/auth.log` – Authentication logs
* `/var/log/dmesg` – Kernel logs
* `/var/log/nginx/` – Nginx logs

Commands:

* `tail -f /var/log/syslog` – Monitor logs live
* `grep "error" /var/log/syslog` – Search logs for errors

---

## 10. Environment Variables

* `echo $PATH` – Show PATH variable
* `export VAR=value` – Set environment variable
* `env` – List all environment variables
* To make variables persistent: add them to `~/.bashrc` or `~/.zshrc`.

---

## 11. Shell Scripting Basics

* Shell scripts are used to automate tasks.
  Example script:

```bash
#!/bin/bash
echo "Hello, DevOps"
date
```

* Make executable: `chmod +x script.sh`
* Run: `./script.sh`

---

## 12. System Monitoring and Performance

* `uptime` – Show system uptime
* `free -h` – Show memory usage
* `vmstat` – Performance statistics
* `iostat` – CPU and disk statistics
* `dstat` – Comprehensive system stats

---

## 13. Archiving and Compression

* `tar -cvf archive.tar file1 file2` – Create tar archive
* `tar -xvf archive.tar` – Extract tar archive
* `gzip file` – Compress
* `gunzip file.gz` – Decompress

---

## 14. Cron Jobs and Automation

* Cron is used to schedule tasks.
* Edit cron jobs: `crontab -e`
* List cron jobs: `crontab -l`

Example: Run script every day at 5 AM:

```
0 5 * * * /home/user/script.sh
```

---

## 15. Important DevOps-Specific Linux Concepts

* **SSH Key Management** – Secure authentication for servers.
* **Service Management**

  * `systemctl start service`
  * `systemctl stop service`
  * `systemctl restart service`
  * `systemctl status service`
* **Firewall Management**

  * `ufw enable` / `ufw disable`
  * `ufw allow 22` (allow SSH)
  * `ufw status`

---

## 16. Best Practices for DevOps Engineers

* Always use SSH keys instead of passwords for remote servers.
* Use `sudo` instead of root for security.
* Keep system packages updated.
* Monitor system logs regularly.
* Automate repetitive tasks with shell scripts.
* Maintain backups and recovery strategies.

---