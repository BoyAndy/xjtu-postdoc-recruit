# Set UTF-8 and chdir to publish dir
chcp 65001 | Out-Null
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8
$env:PATH = "C:\Program Files\GitHub CLI;" + $env:PATH

# Save path for next step
$pubPath = (Get-Location).Path
$pubPath | Out-File -FilePath "C:\Users\Neuro Feedback\AppData\Local\Temp\dir_path.txt" -NoNewline
Write-Output "CWD = $pubPath"

Write-Output "=== git init ==="
git init -b main 2>&1 | Out-String

Write-Output "=== git config ==="
git config user.name "BoyAndy" 2>&1
git config user.email "BoyAndy@users.noreply.github.com" 2>&1

Write-Output "=== git add ==="
git add . 2>&1 | Out-String

Write-Output "=== git status ==="
git status --short 2>&1 | Out-String

Write-Output "=== git commit ==="
git commit -m "Initial: XJTU postdoc recruitment page" 2>&1 | Out-String

Write-Output "=== git log ==="
git log --oneline 2>&1 | Out-String
