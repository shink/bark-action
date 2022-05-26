# Bark Action

<p align="center">
    <a href="LICENSE"><img src="https://img.shields.io/github/license/shink/bark-action.svg" /></a>
    <img src="https://img.shields.io/badge/language-shell-89E051.svg" />
    <img src="https://img.shields.io/github/stars/shink/bark-action.svg?label=stars&logo=github" />
    <img src="https://img.shields.io/github/forks/shink/bark-action.svg?label=forks&logo=github" />
</p>

<p align="center">
    <a href="README_zh.md"><b>中文文档</b></a> •
    <a href="https://github.com/marketplace/actions/bark-action"><b>GitHub Marketplace</b></a>
</p>

A GitHub Action that pushes notifications via [Finb/Bark](https://github.com/Finb/Bark).

## Usage

```yml
name: 'Send Notifications via Bark'

on: [ push ]

jobs:
  notify:
    name: Notify
    runs-on: ubuntu-latest
    steps:
      - name: Push notification
        uses: shink/bark-action@v1
        with:
          key: ${{ secrets.KEY }}       # Your secret key, it is required
          host: ${{ secrets.HOST }}     # Your Bark host, the default is 'https://api.day.app'
          title: Message title
          body: Message body
          sound: alarm
          isArchive: 1
          url: https://yuanhaoji.com
          automaticallyCopy: 1
          copy: Content copied to clipboard
```

> Among them, only the `key` field is required.

- `host`: Custom Bark server hostname
- `title`: Message title (a bit thicker than the content font size)
- `body`: Message content
- `sound`: [Push notification sound](https://github.com/Finb/Bark/tree/master/Sounds)
- `isArchive`: Whether to save to the historical record (`1` means save)
- `url`: The address that will be redirected to the url (when sending, URL parameters need to be encoded)
- `automaticallyCopy`: When this parameter is carried, the content will be automatically copied to the clipboard
- `copy`: When carrying this parameter, only the value of this parameter will be copied

For more information, please check out [Finb/Bark](https://github.com/Finb/Bark).

## License

[MIT](LICENSE)
