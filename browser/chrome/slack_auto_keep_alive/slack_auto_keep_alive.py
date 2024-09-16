from selenium import webdriver
from selenium.webdriver.chrome.service import Service
import time

# ChromeDriverのパス
driver_path = '/usr/local/bin/chromedriver'
# Serviceオブジェクトを使ってChromeDriverのパスを指定
service = Service(executable_path=driver_path)
# WebDriverのセットアップ
driver = webdriver.Chrome(service=service)

# SlackワークスペースのURLにアクセス
driver.get('https://your-slack-workspace-url.slack.com')

# ログインが必要な場合、手動でログイン
# (この時、2要素認証などがある場合も処理が必要です)


# 定期的にメッセージ入力欄をクリックしてアクティブにする
while True:
    try:
        # メッセージ入力欄のXPath
        message_box = driver.find_element_by_xpath('//div[@data-qa="message_input"]')

        # メッセージ入力欄をクリック
        message_box.click()

        # 5分おきに実行
        time.sleep(300)

    except Exception as e:
        print(f'エラー: {e}')

