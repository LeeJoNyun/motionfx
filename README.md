# MotionFX

말하는 세로 영상(1분 안쪽)을 넣으면 말에 맞춰 큰 글자, 자막, 설명 카드 같은 모션그래픽을 입혀 줍니다. 사람 뒤로 글자가 지나가도록 인물을 따로 오려 내는 것도 앱이 알아서 합니다.

마음에 드는 편집 방식은 「내 방식」에 저장해 두고 영상마다 골라 쓰면 됩니다. 영상 파일은 컴퓨터 밖으로 나가지 않습니다.

## 한 줄로 설치

**윈도우**: 시작 메뉴에서 PowerShell 을 열고 붙여 넣으세요. 바탕화면과 시작 메뉴에 바로가기가 생깁니다.

```powershell
irm https://raw.githubusercontent.com/LeeJoNyun/motionfx/main/install.ps1 | iex
```

**맥 (M1 이상)**: 터미널을 열고 붙여 넣으세요. 응용 프로그램 폴더에 들어가고, 이렇게 깔면 "확인되지 않은 개발자" 창도 뜨지 않습니다.

```sh
curl -fsSL https://raw.githubusercontent.com/LeeJoNyun/motionfx/main/install.sh | bash
```

새 판이 나오면 같은 줄을 다시 치면 됩니다. 만들어 둔 방식과 작업은 그대로 남습니다. 윈도우에서 지울 때는 `irm https://raw.githubusercontent.com/LeeJoNyun/motionfx/main/uninstall.ps1 | iex` 를 치세요.

## 직접 내려받기

[Releases](https://github.com/LeeJoNyun/motionfx/releases/latest)에서 컴퓨터에 맞는 파일을 받으세요.

| 컴퓨터 | 파일 |
|---|---|
| 맥 (M1 이상, macOS 12 이상) | `MotionFX-0.1.2-mac-arm64.dmg` |
| 윈도우 10·11 (64비트) | `MotionFX-0.1.2-win-x64.zip` |

인텔 맥은 아직 지원하지 않습니다.

## 처음 열 때

정식 서명을 받지 않은 앱이라 처음 한 번은 운영체제가 막습니다.

**맥**: dmg를 열어 MotionFX를 응용 프로그램 폴더로 끌어 넣습니다. 처음 열면 "확인되지 않은 개발자" 창이 뜨는데, 그때 시스템 설정 → 개인정보 보호 및 보안으로 가서 맨 아래 「그래도 열기」를 누르면 됩니다.

**윈도우**: zip을 풀고 `MotionFX` 폴더 안의 `MotionFX.exe`를 실행합니다. 파란 "Windows의 PC 보호" 창이 뜨면 「추가 정보」 → 「실행」을 누르세요. 폴더째로 원하는 곳에 옮겨 두고 써도 됩니다.

첫 영상을 만들 때 받아쓰기 모델(약 550MB)을 한 번 내려받습니다. 그다음부터는 인터넷 없이도 받아쓰기가 됩니다.

## 쓰는 법

1. 「만들기」에서 영상을 끌어다 놓고 방식을 고른 뒤 「만들기」를 누릅니다.
2. 끝나면 「보기」로 확인하고 「저장」으로 원하는 곳에 내보냅니다.
3. 같은 영상을 다른 방식으로 다시 만들 때는 받아쓰기와 오려내기를 건너뛰므로 금방 끝납니다.

「내 방식」에서는 빠르기, 쓸 장면과 뺄 장면, 색, 글꼴을 바꿀 수 있습니다. 디자인 스타일을 하나씩 소개하는 영상이라면 「효과 카드」나 「스타일 목록」 방식을 골라 보세요. 리퀴드 모션, 글래스모피즘, 픽셀 아트 같은 스타일 32가지를 카드 안에서 움직여 보여 주고, 「스타일 목록」은 번호 목록을 01부터 하나씩 채워 갑니다. 쓸 스타일만 골라 둘 수도 있습니다. 개발 도구나 앱을 하나씩 소개하는 영상이라면 「개발 도구 소개」 방식이 맞습니다. 도구 이름이 나올 때마다 위쪽 배지가 하나씩 차고 이름이 타자 치듯 찍히며, 명령어 얘기에는 터미널 창, 마지막 정리에는 체크리스트가 뜹니다. 만든 방식은 파일로 내보내 다른 컴퓨터로 옮길 수 있습니다.

장면은 지금 기본 규칙으로 짭니다. 설정의 서버 연결은 따로 받은 주소와 열쇠가 있을 때만 쓰고, 비워 두면 됩니다.

## 그래픽 카드

인물 오려내기는 그래픽 카드(내장 그래픽 포함)로 돌리고, 그래픽을 못 쓰는 환경이면 CPU로 넘어갑니다. CPU로 돌면 1분 영상 기준 몇 분 더 걸립니다.

## 같이 들어 있는 프로그램

| 이름 | 쓰는 곳 | 라이선스 |
|---|---|---|
| [FFmpeg](https://ffmpeg.org) 6.0 | 영상 자르고 붙이기 | GPL/LGPL. 소스는 [ffmpeg.org](https://ffmpeg.org/releases/ffmpeg-6.0.tar.xz), 빌드는 [ffmpeg-static b6.0](https://github.com/eugeneware/ffmpeg-static/releases/tag/b6.0) |
| [whisper.cpp](https://github.com/ggml-org/whisper.cpp) | 받아쓰기 | MIT |
| [MediaPipe](https://github.com/google-ai-edge/mediapipe) Face Landmarker | 얼굴 위치 | Apache 2.0 |
| [MODNet](https://github.com/ZHKKKe/MODNet) + [ONNX Runtime](https://github.com/microsoft/onnxruntime) | 인물 오려내기 | Apache 2.0 / MIT |
| [Electron](https://www.electronjs.org) | 앱 틀 | MIT |

라이선스 원문은 앱 안 `resources/vendor` 폴더에 있습니다.

## 문의

문제가 생기면 [Issues](https://github.com/LeeJoNyun/motionfx/issues)에 남겨 주세요. 어떤 컴퓨터에서 어느 단계에서 멈췄는지 적어 주시면 빨리 볼 수 있습니다.
