# 모션쇼츠룸 윈도우 지우기
#   irm https://raw.githubusercontent.com/LeeJoNyun/motionfx/main/uninstall.ps1 | iex
#   만든 방식·작업까지 지우려면 %APPDATA%\MotionFX 폴더도 지우세요.
Get-Process MotionShortsroom, MotionFX -ErrorAction SilentlyContinue | Stop-Process -Force
Start-Sleep -Seconds 1
foreach ($n in 'MotionShortsroom', 'MotionFX') { Remove-Item (Join-Path $env:LOCALAPPDATA "Programs\$n") -Recurse -Force -ErrorAction SilentlyContinue }
foreach ($p in @([Environment]::GetFolderPath('Programs'), [Environment]::GetFolderPath('Desktop'))) {
  foreach ($n in '모션쇼츠룸', 'MotionFX') { Remove-Item (Join-Path $p "$n.lnk") -Force -ErrorAction SilentlyContinue }
}
Write-Host '모션쇼츠룸을 지웠습니다.'
