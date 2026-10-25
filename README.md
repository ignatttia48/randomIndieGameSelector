# 🎮 RandomSelector｜今天玩什麼？

一款使用 **SwiftUI** 製作的隨機 iOS App。不知道今天要玩哪款遊戲時，按下按鈕，讓 App 從我收藏的獨立遊戲裡幫你抽一款。

> 本專案為 iOS App 課程作業 

## 📸 截圖

<!-- 把截圖放進專案後，改成對應路徑，例如：
<img src="Screenshots/home.png" width="300" />
-->

## ✨ 功能

- 點擊「隨機抽一款」，快速輪播數款遊戲後停在最終結果
- 以圖文呈現結果：遊戲封面、英文名稱、中文名稱、發行年份、開發商與遊戲介紹
- 每次抽選保證不會抽到與目前相同的遊戲
- 每款遊戲有各自的代表色，背景漸層、標籤與按鈕會跟著變化
- 抽選時有骰子旋轉動畫與觸覺回饋（Haptic Feedback）
- 內容較長時可捲動，按鈕固定在畫面底部

## 🎲 遊戲清單

| 遊戲 | 中文名稱 | 年份 | 開發商 |
| --- | --- | --- | --- |
| Undertale | 傳說之下 | 2015 | Toby Fox |
| Stardew Valley | 星露谷物語 | 2016 | ConcernedApe |
| Hollow Knight | 空洞騎士 | 2017 | Team Cherry |
| Cuphead | 茶杯頭 | 2017 | Studio MDHR |
| Celeste | 蔚藍 | 2018 | Maddy Makes Games |
| Dead Cells | 死亡細胞 | 2018 | Motion Twin |
| Slay the Spire | 殺戮尖塔 | 2019 | Mega Crit |
| A Short Hike | 短途旅行 | 2019 | adamgryu |

## ✅ 作業需求對照

| 需求 | 實作 |
| --- | --- |
| 點選隨機 button 後用圖文呈現答案 | 按下「隨機抽一款」後顯示遊戲封面圖與文字資訊 |
| 定義資料的型別 | 自訂 `Game` struct |
| 至少準備 5 筆資料，存在 Array | 8 筆遊戲資料，存放於 `games` 陣列 |
| 至少顯示三種資訊 | 顯示名稱（中英文）、年份、開發商、介紹，共四種以上 |

## 🛠 技術

- Swift 5 / SwiftUI
- `@State` 管理目前選中的遊戲與抽選狀態
- `Task` + `async/await` 製作輪播動畫
- `withAnimation`、`transition` 製作切換效果
- `UIImpactFeedbackGenerator` 提供觸覺回饋

## 🚀 執行方式

1. 下載或 clone 本專案
   ```bash
   git clone <你的 GitHub repo 網址>
   ```
2. 用 Xcode 開啟 `RandomSelector.xcodeproj`
3. 選擇 iPhone 模擬器或實機
4. 按下 `⌘ + R` 執行

**環境需求**：專案設定的最低版本為 iOS 27.0，支援 iPhone 與 iPad，請使用對應版本的 Xcode 開啟。

## 📁 專案結構

```
RandomSelector
├── RandomSelector.xcodeproj
└── RandomSelector
    ├── RandomSelectorApp.swift   # App 進入點
    ├── ContentView.swift         # 主畫面、Game 資料型別與隨機邏輯
    └── Assets.xcassets           # 遊戲封面圖片
```

## 📝 備註

遊戲封面圖片與遊戲名稱的著作權屬於各遊戲的原開發商與發行商，本專案僅作課堂作業與學習用途，無商業目的。
