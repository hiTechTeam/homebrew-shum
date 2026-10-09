# Shum Homebrew Tap

[English](README.md) · Русский

Формула Homebrew и готовые выпуски [Shum CLI](https://github.com/hiTechTeam/Shum-CLI).

## Установка и обновление

**0.1.6 preview, macOS 15+, Apple Silicon и Intel.**

```sh
brew install hitechteam/shum/shum
shum
```

Первый запуск предлагает создать профиль. Обновление:

```sh
brew update
brew upgrade shum
```

Формула проверяет SHA-256 и устанавливает Shum.app. Служба использует стабильный путь `opt/shum`. Следующая команда CLI заменяет старую службу, сохраняя профиль и очередь отправки.

В [выпуске](https://github.com/hiTechTeam/homebrew-shum/releases/tag/v0.1.6) есть универсальный архив, контрольные суммы, установщик и сведения о подписи. Сертификат самоподписанный, не Developer ID; нотарификации нет, контейнер pkg не подписан. Intel проверен только под Rosetta. Gatekeeper на чистой учётной записи и сохранение разрешения Bluetooth между сертификатными выпусками пока не проверены.

## Без Homebrew

Установка и обновление одной командой:

```sh
curl -fsSL https://raw.githubusercontent.com/hiTechTeam/Shum-CLI/main/install.sh | sh
```

Установка в `~/.local/share/shum` и `~/.local/bin`, с проверкой суммы и подписи. При необходимости выводится подсказка PATH. Файлы оболочки не меняются. Установка рядом с Homebrew отклоняется.

## Удаление

```sh
shum daemon --uninstall
brew uninstall shum
```

Для установки скриптом:

```sh
curl -fsSL https://raw.githubusercontent.com/hiTechTeam/Shum-CLI/main/install.sh | sh -s -- --uninstall
```

Службы и LaunchAgents удаляются. Профили, ключи и сообщения остаются в `~/Library/Application Support/org.Shum.Shum` или вашем `--data-dir`; ключи могут быть в Keychain. Для полного стирания сначала остановите службы, затем вручную удалите каталог данных и объекты Shum этого профиля в Keychain.

Если формула уже удалена, выгрузите и удалите каждый существующий plist Shum:

```sh
launchctl bootout "gui/$(id -u)" "$HOME/Library/LaunchAgents/org.shum.cli.<profile-id>.plist"
rm "$HOME/Library/LaunchAgents/org.shum.cli.<profile-id>.plist"
```

Подставьте ID из имени файла. `KeepAlive=false` предотвращает цикл перезапуска без бинарника.

Пакеты Windows и Linux готовятся. См. [документацию CLI](https://github.com/hiTechTeam/Shum-CLI) и [проверки выпуска](https://github.com/hiTechTeam/Shum-CLI/blob/main/docs/release-verification.md).

## Лицензия

[MIT](LICENSE). Автоматический CI выключен.
