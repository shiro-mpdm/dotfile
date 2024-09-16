# Slack Login Persistence
## Why

## What
### overview
- 📁 slack_auto_keep_alive
    - 📁 chromedriver_mac64
        - `LICENSE.chromedriver`
        - `chromedriver*`
    - 📄 slack_auto_keep_alivei.py
    - ℹ️ readme.md

### Prepareation
- Python 準備:
    - `$ brew install python`
    - `$ pip3 install selenium`
- Python 実行:
    - `$ python3 slack_auto_keep_alive.py`
- [ChromeDriver](https://sites.google.com/chromium.org/driver/) :
    - https://sites.google.com/chromium.org/driver/downloads
    - https://storage.googleapis.com/chrome-for-testing-public/129.0.6668.42/mac-arm64/chromedriver-mac-arm64.zip
    - `$ unzip ~/Downloads/chromedriver_mac64.zip -d ~/Downloads/`
        - `LICENSE.chromedriver`
        - `chromedriver*`
    - `$ sudo mv ~/Downloads/chromedriver /usr/local/bin/`
    - `$ sudo chmod +x /usr/local/bin/chromedriver`
    - `$ which chromedriver`

- Python 実行ができなかったら。
    - chromedriverを許可
        - システム環境設定 > セキュリティとプライバシー
        - 一般 タブの下に「“chromedriver”は開発者が未確認のため開けません」という警告が表示されているはず
        - この画面で 「このまま開く」 または 「許可する」 ボタンが表示されている場合はそれをクリック
    - `$ sudo xattr -d com.apple.quarantine /usr/local/bin/chromedriver`
        - ダウンロード時に付与された「隔離（quarantine）」属性が削除される

### outlook (展望)
- Python のExeファイルにして、ローカルアプリにしたい
- Chrome Extensionにしたい


## Ref.
- [【mac】zipファイル操作コマンド](https://qiita.com/griffin3104/items/948e38aab62bbb0d0610) Qiita
- []()


