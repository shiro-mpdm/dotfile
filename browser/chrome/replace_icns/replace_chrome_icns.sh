#!/bin/sh

# スクリプトのディレクトリを取得
SCRIPT_DIR=$(dirname "$0")

# 置き換えるアイコンのパス
NEW_APP_ICON="$SCRIPT_DIR/app.icns"
NEW_DOC_ICON="$SCRIPT_DIR/document.icns"

# 変更監視用のタイムスタンプファイル
TIMESTAMP_FILE="$SCRIPT_DIR/.chrome_last_update"

# Chromeのアプリケーションパス(Rootパスの為 ※$HOMEの２つ上にある)
CHROME_APP_PATH="/Applications/Google Chrome.app"

# Chromeのタイムスタンプを取得
CHROME_MOD_TIME=$(stat -f "%Sm" -t "%Y-%m-%d %H:%M:%S" "$CHROME_APP_PATH")

# 前回のタイムスタンプを読み込む
if [ -f "$TIMESTAMP_FILE" ]; then
    LAST_MOD_TIME=$(cat "$TIMESTAMP_FILE")
else
    LAST_MOD_TIME=""
fi

# タイムスタンプが変わった場合、アイコンを置き換える
if [ "$CHROME_MOD_TIME" != "$LAST_MOD_TIME" ]; then
    echo "Chrome has been updated. Replacing icons..."
    cp "$NEW_APP_ICON" "$CHROME_APP_PATH/Contents/Resources/app.icns"
    cp "$NEW_DOC_ICON" "$CHROME_APP_PATH/Contents/Resources/document.icns"
    touch "$TIMESTAMP_FILE"
    echo "$CHROME_MOD_TIME" > "$TIMESTAMP_FILE"
else
    echo "No update detected."
fi

