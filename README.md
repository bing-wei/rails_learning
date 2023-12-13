# Rail 學習
## 功能
* 新增、編輯及刪除候選人
* 新增投票功能

## 環境
* Ruby version : 3.2.2
* Rails version : 7.1.2

## 目前已知問題
* 可能由於JavaScript未能成功執行，故刪除功能會採用show
    * 刪除功能設定為Delete實際採用Show
    * 無法跳出確認投票、確認刪除視窗
    * 投票功能設定為Post實際採用Get
