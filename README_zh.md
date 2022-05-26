# Bark Action

<p align="center">
    <a href="LICENSE"><img src="https://img.shields.io/github/license/shink/bark-action.svg" /></a>
    <img src="https://img.shields.io/badge/language-shell-89E051.svg" />
    <img src="https://img.shields.io/github/stars/shink/bark-action.svg?label=stars&logo=github" />
    <img src="https://img.shields.io/github/forks/shink/bark-action.svg?label=forks&logo=github" />
</p>

<p align="center">
    <a href="README.md"><b>English Document</b></a> •
    <a href="https://github.com/marketplace/actions/bark-action"><b>GitHub Marketplace</b></a>
</p>

一个通过 [Finb/Bark](https://github.com/Finb/Bark) 推送通知的 GitHub Action。

## 使用

```yaml
name: 'Push Notifications via Bark'

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

> 其中，只有 `key` 字段是必填的。

- `host`: 自行搭建的 Bark 服务的地址
- `title`: 标题（比内容字号粗一点）
- `body`: 内容
- `sound`: [推送铃声](https://github.com/Finb/Bark/tree/master/Sounds)
- `isArchive`: 是否保存到历史记录（`1` 为保存，其他值为不保存）
- `url`: 将跳转到 url 的地址（发送时，URL 参数需要编码）
- `automaticallyCopy`: 携带该参数时，将自动复制推送内容到剪贴板
- `copy`: 携带该参数时，只复制该参数的值

更多详情请查看 [Finb/Bark](https://github.com/Finb/Bark)。

## 许可证

[MIT](LICENSE)
