![image alt](https://github.com/rakan-khaled1/ftp-brute-force-tool/blob/10014eb4465f7ececc8eb61cf90217eecdfc462a/FTP.png)

# FTP Brute Force Tool (Educational)

## 📌 Description
This is an educational FTP brute force tool written in **Bash**, designed to perform authorized security testing against FTP services.  
The tool uses **Nmap** to check if the FTP service is open and **Hydra** to perform brute force attacks using custom or built-in wordlists.

> ⚠️ This tool is intended for **educational purposes only** and must be used **only on systems you own or have explicit permission to test**.

---

## ✨ Features
- FTP service detection using Nmap
- Supports custom username and password wordlists
- Includes built-in username and password lists
- Automatically falls back to default wordlists if none are provided
- Clean and user-friendly banner output
- Results saved to a file

---

## 🛠 Requirements
Make sure the following tools are installed on your system:
- `bash`
- `nmap`
- `hydra`

On Kali Linux, they are installed by default.

---

## 📂 Installation
Clone the repository and place it in the required directory:

```bash
cd /home/kali
git clone https://github.com/your-username/ftp-brute-force-tool.git
cd ftp-brute-force-tool
chmod +x ftpbrute.sh
⚠️ The tool must be located in /home/kali for the built-in wordlists to work correctly.

📁 Wordlists
The tool includes built-in wordlists:

Usernames

Passwords

Default paths:

swift
Copy code
/home/kali/ftp-brute-force-tool/ftp_usernames_list.txt
/home/kali/ftp-brute-force-tool/ftp_passwords_list.txt
▶️ Usage
Run the tool using:

bash
Copy code
bash ftpbrute.sh
You will be prompted to:

Enter the target IP

Provide custom username and password wordlists (optional)

If you press Enter without providing paths, the tool will automatically use the built-in wordlists.

📄 Output
All brute force results are displayed in the terminal

Successful login attempts are saved to:

Copy code
login_result.txt
⚠️ Disclaimer
This project is created strictly for educational and authorized penetration testing purposes.
The author is not responsible for any misuse or illegal activities performed using this tool.

👤 Author
Rakan Khaled
Cybersecurity Student | Ethical Hacking & Pentesting
