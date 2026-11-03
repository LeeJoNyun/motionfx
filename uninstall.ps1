# MotionFX 윈도우 지우기
#   irm https://raw.githubusercontent.com/LeeJoNyun/motionfx/main/uninstall.ps1 | iex
#   만든 방식·작업까지 지우려면 %APPDATA%\MotionFX 폴더도 지우세요.
Get-Process MotionFX -ErrorAction SilentlyContinue | Stop-Process -Force
Start-Sleep -Seconds 1
Remove-Item (Join-Path $env:LOCALAPPDATA 'Programs\MotionFX') -Recurse -Force -ErrorAction SilentlyContinue
foreach ($p in @([Environment]::GetFolderPath('Programs'), [Environment]::GetFolderPath('Desktop'))) {
  Remove-Item (Join-Path $p 'MotionFX.lnk') -Force -ErrorAction SilentlyContinue
}
Write-Host 'MotionFX 를 지웠습니다.'
