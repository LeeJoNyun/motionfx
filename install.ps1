# MotionFX 윈도우 설치
#   PowerShell 에서:  irm https://raw.githubusercontent.com/LeeJoNyun/motionfx/main/install.ps1 | iex
#   다시 치면 최신판으로 바꿔 깝니다. 만든 방식과 작업은 그대로 남습니다.
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$rel = Invoke-RestMethod 'https://api.github.com/repos/LeeJoNyun/motionfx/releases/latest'
$asset = $rel.assets | Where-Object { $_.name -like '*win-x64.zip' } | Select-Object -First 1
if (-not $asset) { throw '윈도우용 파일을 찾지 못했습니다' }

$root = Join-Path $env:LOCALAPPDATA 'Programs'
$dir = Join-Path $root 'MotionFX'
$zip = Join-Path $env:TEMP $asset.name
Write-Host "MotionFX $($rel.tag_name) 받는 중 ($([math]::Round($asset.size / 1MB))MB)..."
Invoke-WebRequest $asset.browser_download_url -OutFile $zip -UseBasicParsing

Get-Process MotionFX -ErrorAction SilentlyContinue | Stop-Process -Force
Start-Sleep -Seconds 1
if (Test-Path $dir) { Remove-Item $dir -Recurse -Force }
New-Item -ItemType Directory -Force $root | Out-Null
Write-Host '압축 푸는 중...'
Expand-Archive $zip -DestinationPath $root -Force
Remove-Item $zip
Get-ChildItem $dir -Recurse | Unblock-File

$exe = Join-Path $dir 'MotionFX.exe'
$sh = New-Object -ComObject WScript.Shell
foreach ($p in @([Environment]::GetFolderPath('Programs'), [Environment]::GetFolderPath('Desktop'))) {
  $l = $sh.CreateShortcut((Join-Path $p 'MotionFX.lnk'))
  $l.TargetPath = $exe; $l.WorkingDirectory = $dir; $l.Save()
}
Write-Host "설치했습니다: $dir"
Write-Host '바탕화면과 시작 메뉴에 MotionFX 바로가기를 만들었습니다.'
Start-Process $exe
