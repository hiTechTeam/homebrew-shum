# Shum Homebrew Tap

[English](README.md) · Русский

Формула Homebrew и готовые выпуски [Shum CLI](https://github.com/hiTechTeam/Shum-CLI).

## Установка и обновление

**0.1.7 preview, ревизия Homebrew 2 (0.1.7_2), macOS 15+, Apple Silicon и Intel.**

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

В [выпуске](https://github.com/hiTechTeam/homebrew-shum/releases/tag/v0.1.7-r2) есть универсальный архив, контрольные суммы, установщик и сведения о подписи. Сертификат самоподписанный, не Developer ID; нотарификации нет, контейнер pkg не подписан. Intel проверен только под Rosetta. Gatekeeper на чистой учётной записи и сохранение разрешения Bluetooth между сертификатными выпусками пока не проверены.

Приложение по-прежнему показывает `shum 0.1.7`. Эта сборка показывает пиксельные реакции с именами авторов в переписке. У одинаковой реакции одна иконка и имена через `/`, у разных своя иконка и имя автора.

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

Службы и LaunchAgents удаляются. Профили, ключи и сообщения остаются в `~/Library/Application Support/org.Shum.Shum` или вашем `--data-dir`; ключи могут быть в Keychain. Для полного стирания профилей, ключей и переписки выполните `shum daemon --uninstall --purge` перед `brew uninstall shum` и подтвердите словом `DELETE`. Ключи профилей в Keychain также удаляются. Без `--data-dir` учитываются корни Shum из LaunchAgents. Посторонние файлы сохраняются.

Если формула уже удалена, выгрузите и удалите каждый существующий plist Shum:

```sh
launchctl bootout "gui/$(id -u)" "$HOME/Library/LaunchAgents/org.shum.cli.<profile-id>.plist"
rm "$HOME/Library/LaunchAgents/org.shum.cli.<profile-id>.plist"
```

Подставьте ID из имени файла. `KeepAlive=false` предотвращает цикл перезапуска без бинарника.

Пакеты Windows и Linux готовятся. См. [документацию CLI](https://github.com/hiTechTeam/Shum-CLI) и [проверки выпуска](https://github.com/hiTechTeam/Shum-CLI/blob/main/docs/release-verification-0.1.7-r2.md).

## Лицензия

[MIT](LICENSE). Автоматический CI выключен.
