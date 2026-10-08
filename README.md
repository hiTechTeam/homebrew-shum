# Shum CLI для Homebrew

Shum в терминале: чаты, приглашения, общение через интернет и Bluetooth.

## Установка

Текущий выпуск: **0.1.4 preview**, macOS **15.0 и новее**, **Apple Silicon**.

```sh
brew install hitechteam/shum/shum
shum
```

Первый запуск предложит создать профиль. Для списка чатов: `shum chats`.

Обновление:

```sh
brew update
brew upgrade shum
```

Формула устанавливает готовый бинарник и проверяет SHA-256.
В [Releases](https://github.com/hiTechTeam/homebrew-shum/releases) также доступен установщик `.pkg`.
Этот предварительный выпуск не подписан сертификатом Developer ID и не нотарифицирован Apple.

## Поддерживаемые платформы

| Платформа | Статус |
| --- | --- |
| macOS 15+, Apple Silicon | Homebrew и `.pkg` |
| macOS Intel | Пакет готовится |
| Windows / winget | Пакет готовится |
| Linux / apt / dnf | Пакеты готовятся |

Если CLI уже устанавливался другим способом, `command -v shum` покажет используемую копию.
После установки через Homebrew актуальная версия находится в `$(brew --prefix)/bin/shum`.
Профили и переписка хранятся отдельно от бинарника и сохраняются при обновлении.
