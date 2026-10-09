# Shum CLI для Homebrew

Shum в терминале: чаты, приглашения, интернет-переписка и Bluetooth.
Исходники клиента: [hiTechTeam/Shum-CLI](https://github.com/hiTechTeam/Shum-CLI).

## Установка и обновление

Текущий выпуск: **0.1.6 preview**, **macOS 15+, Apple Silicon и Intel**.

```sh
brew install hitechteam/shum/shum
shum
```

Первый запуск предлагает создать профиль. Список чатов: `shum chats`.

```sh
brew update
brew upgrade shum
```

Формула проверяет SHA-256 и устанавливает подписанный `Shum.app`.
Команда `bin/shum` ссылается на бинарник внутри него. Служба использует
стабильный `opt/shum`, при следующем запуске CLI обновляется автоматически
по версии и хэшу, сохраняя очередь отправки и профиль.

[Выпуск 0.1.6](https://github.com/hiTechTeam/homebrew-shum/releases/tag/v0.1.6)
содержит универсальный архив, SHA-256, установщик `.pkg` и сведения о подписи.
Shum.app подписан постоянным сертификатом Shum CLI Signing. Сертификат
самоподписанный, не Developer ID; нотарификации Apple нет, контейнер `.pkg`
без подписи Installer. Запуск без предупреждений Gatekeeper на чистой
учётной записи и отсутствие повторного запроса Bluetooth при настоящем
обновлении пока не подтверждены. На настоящем Intel Mac проверки не было;
запуск и релейный сценарий проверены под Rosetta.

## Установка без Homebrew

```sh
curl -fsSL https://raw.githubusercontent.com/hiTechTeam/Shum-CLI/main/install.sh | sh
```

Скрипт ставит бандл в `~/.local/share/shum`, команду в `~/.local/bin/shum`.
Он проверяет SHA-256 и подпись, не меняет файлы оболочки и отказывается
создавать вторую копию рядом с Homebrew. Повторный запуск обновляет установку.
Если PATH не содержит `~/.local/bin`, скрипт печатает нужную команду.

## Удаление

Перед удалением пакета:

```sh
shum daemon --uninstall
brew uninstall shum
```

Для установки скриптом:

```sh
curl -fsSL https://raw.githubusercontent.com/hiTechTeam/Shum-CLI/main/install.sh | sh -s -- --uninstall
```

Службы всех профилей останавливаются, LaunchAgents и кэш приложения удаляются.
Профили, ключи и переписка остаются. Данные macOS лежат в
`~/Library/Application Support/org.Shum.Shum` или в заданном `--data-dir`;
ключи обычных профилей находятся в Keychain. Для полного стирания после
остановки служб удалите свой каталог данных вручную, затем отдельно ключи
Shum в Keychain. Не удаляйте каталог, если хотите сохранить переписку.

Если формула уже удалена, для каждого файла Shum в `~/Library/LaunchAgents`:

```sh
launchctl bootout gui/$(id -u) "$HOME/Library/LaunchAgents/org.shum.cli.<ID_профиля>.plist"
rm "$HOME/Library/LaunchAgents/org.shum.cli.<ID_профиля>.plist"
```

Подставьте ID из имени существующего файла. `KeepAlive=false` не допускает
цикл перезапуска при отсутствии бинарника. После выгрузки службы старый
кэш `Shum.app` и `services/` в своём каталоге данных можно удалить отдельно.
Профили, базу и ключи при ручной очистке не удаляйте.

## Остальные платформы

| Платформа | Статус |
| --- | --- |
| macOS 15+, Apple Silicon и Intel | Homebrew, скрипт и `.pkg` |
| Windows / winget | Пакет готовится |
| Linux / apt / dnf | Пакеты готовятся |

`command -v shum` показывает используемую установку. После установки через
Homebrew актуальная команда находится в `$(brew --prefix)/bin/shum`.
Исходники и текст лицензии доступны в репозитории CLI. Лицензия этого tap: MIT.
Автоматический CI выключен.
