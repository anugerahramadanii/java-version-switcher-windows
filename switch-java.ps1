<#
.AUTHOR
    Rama
    Created with the help of ChatGPT (GPT-5)
    15-09-2025

.SYNOPSIS
    Script to switch Java versions (system-wide) on Windows.

.DESCRIPTION
    This script updates the following system-wide environment variables:
      - JAVA_HOME
      - Path (places %JAVA_HOME%\bin at the beginning, 
        and removes any old Java entries)

    Changes apply system-wide, meaning all new terminals 
    (CMD, PowerShell, Git Bash, etc.) will use the selected version.
    The current terminal session will NOT be updated automatically.

.PARAMETER Version
    Java version to switch to. Options:
      - 8  -> C:\Program Files\Java\jdk1.8.0_202
      - 17 -> C:\Program Files\Java\jdk-17.0.12
      - 21 -> C:\Program Files\Java\jdk-21

.NOTES
    - Must be run in PowerShell **as Administrator** 
      (required to update system environment variables).
    - After running the script, close your old terminal and open a new one.

.EXAMPLE
    PS C:\Scripts\JavaSwitchers> .\switch-java.ps1 17
    Switching to Java 17...
    JAVA_HOME set to C:\Program Files\Java\jdk-17.0.12 (system-wide)
    Please open a new terminal for changes to take effect.
#>

param(
    [Parameter(Mandatory = $true)]
    [ValidateSet("8", "17", "21", "current")]
    [string]$version
)

# Update or adjust these list to match your Java installation path
$JDK8  = "C:\Program Files\Java\jdk1.8.0_202" 
$JDK17 = "C:\Program Files\Java\jdk-17.0.12"
$JDK21 = "C:\Program Files\Java\jdk-21"

switch ($version) {
    "8"       { $JAVA_HOME = $JDK8  }
    "17"      { $JAVA_HOME = $JDK17 }
    "21"      { $JAVA_HOME = $JDK21 }
    "current" {
        Write-Host "JAVA_HOME (system):" ([System.Environment]::GetEnvironmentVariable("JAVA_HOME","Machine"))
        Write-Host "PATH (system):" ([System.Environment]::GetEnvironmentVariable("Path","Machine"))
        java -version
        exit 0
    }
}

if (-not $JAVA_HOME) {
    Write-Host "Usage: .\switch-java.ps1 {8|17|21|current}"
    exit 1
}

# Set JAVA_HOME system-wide
[System.Environment]::SetEnvironmentVariable("JAVA_HOME", $JAVA_HOME, "Machine")

# Update PATH system-wide → delete old java
$oldPath = [System.Environment]::GetEnvironmentVariable("Path", "Machine")
$newPath = ($oldPath -split ";") | Where-Object {$_ -notmatch "Java"}
$newPath = "$JAVA_HOME\bin;" + ($newPath -join ";")
[System.Environment]::SetEnvironmentVariable("Path", $newPath, "Machine")

Write-Host "JAVA_HOME set to $JAVA_HOME (system-wide)"
Write-Host "Please open a new terminal for changes to take effect."
