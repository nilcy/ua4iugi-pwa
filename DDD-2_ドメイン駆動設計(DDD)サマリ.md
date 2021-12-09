# ドメイン駆動設計(DDD)サマリ

---
## ドメイン駆動設計の全体イメージ
``` plantuml
@startuml
skinparam monochrome true
skinparam handwritten false
skinparam defaultFontName "Yu Gothic UI, sans-serif"
usecase モデル駆動設計
usecase レイヤアーキテクチャ
usecase エンティティ
usecase バリューオブジェクト
usecase サービス
usecase アグリゲート
usecase ファクトリ
usecase リポジトリ
usecase スマートUI
スマートUI - モデル駆動設計 : 相互に排他的な選択肢
サービス <-- モデル駆動設計 : モデルを表現する
モデル駆動設計 -> エンティティ : モデルを表現する
エンティティ -> リポジトリ : アクセス
エンティティ -> アグリゲート : 整合性を維持
エンティティ -> アグリゲート : ルートとして機能
リポジトリ <-- アグリゲート : アクセス
モデル駆動設計 --> バリューオブジェクト : モデルを表現する
モデル駆動設計 --> レイヤアーキテクチャ : ドメインを分離
エンティティ --> ファクトリ : カプセル化
バリューオブジェクト --> ファクトリ : カプセル化
アグリゲート --> ファクトリ : カプセル化
@enduml
```
---
## モデルの完全性を維持する方法
1. カスタマ_サプライヤは、上客扱いなうちはいいが…
2. 順応者は、サプライヤの提供レベル低下にあわせて…
3. 防腐レイヤは、廃棄予定のレガシーを新旧ラップする
``` plantuml
@startuml
skinparam monochrome true
skinparam handwritten false
skinparam defaultFontName "Yu Gothic UI, sans-serif"
usecase ユビキタス言語
usecase コンテキスト境界
usecase 継続的な統合
usecase コンテキストマップ
usecase 共有カーネル
usecase カスタマ_サプライヤ
usecase 順応者
usecase 防腐レイヤ
usecase 別々の道
usecase 公開ホストサービス
usecase 公開言語
コンテキスト境界 --> ユビキタス言語 : 名前が入る
継続的な統合 <-- コンテキスト境界 : モデルの統一を保つ
コンテキスト境界 -> コンテキストマップ : 関係を評価/概観する
共有カーネル <-- コンテキストマップ : 関連コンテキストをオーバーラップ
カスタマ_サプライヤ <-- コンテキストマップ : コンテキストを関連付ける
順応者 <-- コンテキストマップ : 一方的にオーバーラップ
コンテキストマップ --> 防腐レイヤ : 翻訳して一方的に絶縁
コンテキストマップ --> 別々の道 : 自由参加のチーム
コンテキストマップ -> 公開ホストサービス : 複数クライアントのサポート
公開ホストサービス -> 公開言語 : 形式化
@enduml
```
---
## レイヤアーキテクチャ
``` plantuml
@startuml
skinparam monochrome true
skinparam handwritten false
skinparam defaultFontName "Yu Gothic UI, sans-serif"
|UI|
start
:単純UI;
|アプリケーション|
|ドメイン|
|インフラ|
:UI補助ライブラリ;
stop
|UI|
start
:参照系UI;
|アプリケーション|
|ドメイン|
:ビジネスオブジェクト;
|インフラ|
:ビジネスオブジェクトの検索;
stop
|UI|
start
:更新系UI;
|アプリケーション|
:ワークフロー;
|ドメイン|
:ビジネスオブジェクトA;
|インフラ|
:ビジネスオブジェクトA1の永続化;
|ドメイン|
:ビジネスオブジェクトA;
|インフラ|
:ビジネスオブジェクトA2の永続化;
stop
|UI|
start
:契約完了UI;
|アプリケーション|
:ワークフロー;
|ドメイン|
:ビジネスオブジェクト;
|アプリケーション|
:ワークフロー;
|インフラ|
:開始案内メール送信;
stop
@enduml
```
---
## 凡例
    関連 (Association) -- : 関係あり(必須)
                       .. : 関係あり(オプション)
    集約 (Aggregation) o-- : 親子は別々の関係
    構成 (Composition) *-- : 親子は共存の関係
    一般化と継承 (Extension) <|-- : 共通と個別の関係
