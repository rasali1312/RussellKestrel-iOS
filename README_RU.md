# Russell Kestrel iPhone — Build 0.2

Я сделал этот пакет специально под нашу ситуацию: **у тебя Windows + iPhone, Mac нет**.

## Что он делает

- Live View для 16 каналов (сейчас 5 камер).
- RTSP через наш уже проверенный внешний адрес Kestrel.
- VLC/VLCKit 4.0-a22 для RTSP.
- Set открывает Kestrel Web Interface.
- Playback пока оставлен отдельным этапом: настоящий архив должен идти с HDD DVR, а старый ActiveX на iOS не работает.

## Как мы получим IPA

Поскольку на Windows нет Xcode, этот проект содержит GitHub Actions workflow. GitHub запускает сборку на своей macOS-машине; GitHub официально предоставляет macOS runners для Actions. После сборки workflow создаёт `RussellKestrel-unsigned.ipa` как Artifact.

### Тебе на Windows нужно будет сделать только:

1. Скачать этот ZIP.
2. Загрузить содержимое в свой GitHub repository.
3. В GitHub открыть **Actions → Build Russell Kestrel IPA → Run workflow**.
4. Скачать готовый Artifact `.ipa`.
5. Установить его на iPhone через Sideloadly на Windows.

Apple ID/пароль мне сообщать не нужно.

## Следом

После установки на iPhone сначала проверяем Live через 4G/5G. Затем я продолжаю работу над **настоящим Playback с HDD Kestrel**, затем audio/talk.
