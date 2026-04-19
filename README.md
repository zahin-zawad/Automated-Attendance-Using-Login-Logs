# Automated-Attendance-Using-Login-Logs
We built an automated attendance system using Linux system logs. The system reads login history using the last command, processes it using shell scripts, and generates structured attendance reports. Automation is achieved using cron jobs for scheduled execution.



# 📊 Automated Attendance Using Login Logs (Ubuntu)

A simple Linux-based attendance system that automatically generates user attendance using system login records.

This project uses shell scripting and system logs to track:
- Login time
- Logout time
- Session duration
- Daily and monthly attendance reports

---

## 🚀 Features

- ✅ Login & logout tracking using system logs
- ✅ Monthly attendance generation (CSV format)
- ✅ Daily attendance report (readable text format)
- ✅ User full name extraction
- ✅ Session duration calculation
- ✅ Summary analytics (login count per user)
- ✅ Automation using cron jobs

---

## 🛠️ Technologies Used

- Bash (Shell Scripting)
- Linux Commands (`last`, `awk`, `grep`, `getent`)
- Cron (for automation)

---

## 📁 Project Structure

```

attendance-system/
│── logs/
│── reports/
│   └── daily_XX.txt
│── scripts/
│   ├── generate_attendance.sh
│   ├── daily_report.sh
│   ├── summary.sh
│── attendance.csv
│── README.md

````

---

## ⚙️ Setup Instructions

### 1. Clone or Download Project

```bash
git clone <your-repo-link>
cd attendance-system
````

---

### 2. Make Scripts Executable

```bash
chmod +x scripts/*.sh
```

---

### 3. Run the System

```bash
cd scripts

# Generate monthly attendance CSV
./generate_attendance.sh

# Generate today's report
./daily_report.sh

# Show summary analytics
./summary.sh
```

---

## 📄 Output Files

### 📊 `attendance.csv`

Contains:

```
Username,Full Name,Login Time,Logout Time,Duration
```

---

### 📑 `reports/daily_XX.txt`

Clean formatted daily report:

```
User       Full Name        Login Time         Logout Time        Duration
```

---

## 🤖 Automation (Optional but Recommended)

Set up automatic daily report generation using cron.

### Open crontab:

```bash
crontab -e
```

### Add this line:

```bash
0 23 * * * /full/path/to/scripts/daily_report.sh
```

👉 This runs the script every day at **11 PM**

---

## 🧠 How It Works

* The system uses the `last -F` command to read login records from `/var/log/wtmp`
* Shell scripts process and filter logs
* Data is formatted into structured reports
* Full names are fetched from `/etc/passwd`
* Reports are generated automatically or manually

---

## ⚠️ Notes

* If no login data appears:

  * Ensure system is recording logs (`/var/log/wtmp`)
* Users without full names configured may appear blank
* "Still logged in" sessions are ignored

---

## 👥 Team Contribution (Suggested)

| Member | Responsibility               |
| ------ | ---------------------------- |
| 1      | Log Processing Script        |
| 2      | Daily Report Generation      |
| 3      | Summary & Analytics          |
| 4      | Automation (Cron Jobs)       |
| 5      | Documentation & Presentation |

---

## 🎯 Future Improvements

* Add total working hours calculation
* Detect absent users
* Build a web dashboard (React/Node.js)
* Visual analytics (charts/graphs)
* Database integration

---

## 🧑‍🏫 Viva Explanation

> This system automates attendance tracking by analyzing Linux login logs. It uses shell scripting to process system records and generate structured reports, with automation handled via cron jobs.

---

## 📌 Author

**Zahin Zawad**
CSE, Daffodil International University

