#!/bin/bash
# 모션쇼츠룸 맥 설치 (M1 이상)
#   터미널에서:  curl -fsSL https://raw.githubusercontent.com/LeeJoNyun/motionfx/main/install.sh | bash
#   다시 치면 최신판으로 바꿔 깝니다. 만든 방식과 작업은 그대로 남습니다.
set -euo pipefail
DEST="${MOTIONFX_DEST:-/Applications}"
[ "$(uname -m)" = arm64 ] || { echo "M1 이상(애플 실리콘) 맥에서만 됩니다."; exit 1; }

url=$(curl -fsSL https://api.github.com/repos/LeeJoNyun/motionfx/releases/latest \
  | grep -o '"browser_download_url": *"[^"]*mac-arm64\.dmg"' | head -1 | cut -d'"' -f4)
[ -n "$url" ] || { echo "맥용 파일을 찾지 못했습니다."; exit 1; }

tmp=$(mktemp -d); trap 'hdiutil detach "$tmp/mnt" -quiet 2>/dev/null || true; rm -rf "$tmp"' EXIT
echo "모션쇼츠룸 받는 중..."
curl -fL --progress-bar -o "$tmp/m.dmg" "$url"
mkdir "$tmp/mnt"
hdiutil attach -nobrowse -readonly -quiet -mountpoint "$tmp/mnt" "$tmp/m.dmg"
pkill -x MotionShortsroom 2>/dev/null || true
pkill -x MotionFX 2>/dev/null || true
rm -rf "$DEST/MotionShortsroom.app" "$DEST/MotionShortsroom.app"
cp -R "$tmp/mnt/MotionShortsroom.app" "$DEST/"
# 인터넷에서 받은 앱 표시를 지워 "확인되지 않은 개발자" 창 없이 열리게
xattr -dr com.apple.quarantine "$DEST/MotionShortsroom.app" 2>/dev/null || true
echo "설치했습니다: $DEST/MotionShortsroom.app"
[ -n "${MOTIONFX_NOOPEN:-}" ] || open "$DEST/MotionShortsroom.app"
