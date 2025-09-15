# Java Version Switcher (Windows)

[![PowerShell](https://img.shields.io/badge/PowerShell-%233333FF.svg?logo=powershell&logoColor=white)]()
[![Java](https://img.shields.io/badge/Java-%23ED8B00.svg?logo=openjdk&logoColor=white)]()

A simple **PowerShell script** to switch between multiple **Java versions** on Windows.  
It updates `JAVA_HOME` and `Path` **system-wide**, so you don’t need to manually configure environment variables each time.  

---

## ✨ Features
- Switch between multiple installed Java versions with a single command.
- Updates `JAVA_HOME` and `Path` permanently (system-wide).
- Works across terminal sessions (no need to set manually each time).
- Easy to extend with new Java versions.

---

## 📂 Setup

1. Clone the repository:
   ```powershell
   git clone https://github.com/YOUR_USERNAME/java-version-switcher-windows.git
   cd java-version-switcher-windows

## 🚀 Usage
1. Enter dir C:\Scripts\JavaSwitchers\
2. eq:
   .\switch-java.ps1 8
   .\switch-java.ps1 17
   .\switch-java.ps1 21
3. Close and Open new powershell
4. Check current version: java -version
