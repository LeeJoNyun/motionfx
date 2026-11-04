# 모션쇼츠룸

말하는 세로 영상(1분 안쪽)을 넣으면 말에 맞춰 큰 글자, 자막, 설명 카드 같은 모션그래픽을 입혀 줍니다. 사람 뒤로 글자가 지나가도록 인물을 따로 오려 내는 것도 앱이 알아서 합니다.

원하는 느낌을 대화창에 적으면 Claude 가 장면을 짜고, 만든 뒤에도 말로 고칠 수 있습니다. 영상과 소리는 컴퓨터 밖으로 나가지 않고, Claude 에는 받아쓴 글자와 대화만 보냅니다.

## 한 줄로 설치

**윈도우**: 시작 메뉴에서 PowerShell 을 열고 붙여 넣으세요. 바탕화면과 시작 메뉴에 바로가기가 생깁니다.

```powershell
irm https://raw.githubusercontent.com/LeeJoNyun/motionfx/main/install.ps1 | iex
```

**맥 (M1 이상)**: 터미널을 열고 붙여 넣으세요. 응용 프로그램 폴더에 들어가고, 이렇게 깔면 "확인되지 않은 개발자" 창도 뜨지 않습니다.

```sh
curl -fsSL https://raw.githubusercontent.com/LeeJoNyun/motionfx/main/install.sh | bash
```

새 판이 나오면 같은 줄을 다시 치면 됩니다. 만들어 둔 작업은 그대로 남습니다. 윈도우에서 지울 때는 `irm https://raw.githubusercontent.com/LeeJoNyun/motionfx/main/uninstall.ps1 | iex` 를 치세요.

## 직접 내려받기

[Releases](https://github.com/LeeJoNyun/motionfx/releases/latest)에서 컴퓨터에 맞는 파일을 받으세요.

| 컴퓨터 | 파일 |
|---|---|
| 맥 (M1 이상, macOS 12 이상) | `MotionShortsroom-0.1.11-mac-arm64.dmg` |
| 윈도우 10·11 (64비트) | `MotionShortsroom-0.1.11-win-x64.zip` |

인텔 맥은 아직 지원하지 않습니다.

## 처음 열 때

정식 서명을 받지 않은 앱이라 처음 한 번은 운영체제가 막습니다.

**맥**: dmg를 열어 MotionShortsroom을 응용 프로그램 폴더로 끌어 넣습니다. 처음 열면 "확인되지 않은 개발자" 창이 뜨는데, 그때 시스템 설정 → 개인정보 보호 및 보안으로 가서 맨 아래 「그래도 열기」를 누르면 됩니다.

**윈도우**: zip을 풀고 `MotionShortsroom` 폴더 안의 `MotionShortsroom.exe`를 실행합니다. 파란 "Windows의 PC 보호" 창이 뜨면 「추가 정보」 → 「실행」을 누르세요. 폴더째로 원하는 곳에 옮겨 두고 써도 됩니다.

첫 영상을 만들 때 받아쓰기 모델(약 550MB)을 한 번 내려받습니다. 그다음부터는 인터넷 없이도 받아쓰기가 됩니다.

## 쓰는 법

1. 영상을 열고 왼쪽 대화창에 원하는 느낌을 적은 뒤 「영상 만들기」를 누릅니다.
2. 끝나면 「결과」 탭에서 보고, 고칠 곳은 대화창에 말로 적습니다. 받아쓰기와 오려내기는 다시 하지 않아서 금방 끝납니다.
3. 마음에 들면 「저장」으로 원하는 곳에 내보냅니다.

「효과」 탭에서 32가지 효과를 미리 보고 고를 수 있습니다.

## Claude 연결

대화 기능을 쓰려면 셋 중 하나가 필요합니다. 앱에 키가 들어 있지는 않습니다.

- 앱을 켜면 첫 화면에서 쇼츠룸 계정으로 로그인합니다. 로그인은 앱 창 안에서 끝납니다. 지금은 시험 계정만 쓸 수 있습니다. 받아쓴 글자와 대화가 쇼츠룸 서버를 거쳐 Claude 로 갑니다.
- 로그인한 뒤 설정 → Claude 연결에 본인 Claude API 키를 넣을 수도 있습니다. 키는 이 컴퓨터에만 저장되고, 요금은 키 주인의 Claude 계정으로 나갑니다.
- 이 컴퓨터에 Claude Code 를 깔고 로그인해 두면 키 없이 그 계정으로 연결됩니다.

둘 다 없어도 영상은 기본 규칙으로 만들어지지만, 말로 고치는 기능은 쓸 수 없습니다.

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
