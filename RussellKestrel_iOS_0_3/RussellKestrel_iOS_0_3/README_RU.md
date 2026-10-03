# Russell Viewer External — iOS 0.3

Отдельная iPhone/iPad версия на базе рабочей схемы Russell Viewer External.
Windows-версия не изменяется.

## Уже заложено
- iPhone + iPad
- Live до 16 каналов (сейчас используются каналы 1–5)
- внешний Kestrel RTSP через порт 8554
- основной и резервный URL-шаблон в настройках
- сетевой тест перед запуском просмотра
- открытие Kestrel Web Interface из приложения
- отдельный экран Playback для дальнейшего подключения настоящего HDD-архива DVR
- архитектура без ограничения на 5 камер

## Важное
Старый Windows Russell Viewer использует 32-битный Kestrel VPlugin/ActiveX. Этот компонент на iOS не существует, поэтому iOS-клиент использует тот же внешний DVR, но получает медиапоток нативно через RTSP/VLCKit.

## Сборка на Windows
Проект содержит GitHub Actions workflow. Он собирается на macOS runner GitHub и выдаёт unsigned IPA.

1. Загрузить содержимое проекта в GitHub repository.
2. Actions → Build Russell Kestrel iOS → Run workflow.
3. Скачать artifact `RussellKestrel-iOS-IPA`.
4. Установить IPA на iPhone/iPad через Sideloadly.

Apple ID или пароль в проект не входят.
