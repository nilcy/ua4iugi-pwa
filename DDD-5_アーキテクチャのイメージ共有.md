# アーキテクチャ

---
## 全体イメージ
``` plantuml
@startuml
skinparam monochrome true
skinparam handwritten true
skinparam defaultFontName "Yu Gothic UI, sans-serif"
actor USER
package DEVICE {
    boundary UI
    USER - UI : UX
}
cloud CLOUD {
    control BFF
    control MSA
    entity DB
    UI - BFF : GraphQL
    BFF - MSA : REST
    MSA - DB : SQL
}
@enduml
```
---
## ユーザー体験(UX)
``` plantuml
@startuml
skinparam monochrome true
skinparam handwritten true
skinparam defaultFontName "Yu Gothic UI, sans-serif"
actor USER
package UX_RWD {
    boundary React_js
    boundary Next_js
    boundary Phone
    boundary Tablet
    boundary Desktop
    React_js -|> Next_js
    Next_js --|> Phone
    Next_js --|> Tablet
    Next_js --|> Desktop
    Phone -- USER : UX
    Tablet -- USER : UX
    Desktop -- USER : UX
}
note bottom of UX_RWD : Webページのマルチデバイス対応\nシングルページアプリケーション(SPA)用フレームワーク
package UX_XP {
    boundary React_Native
    boundary Web
    boundary iOS
    boundary Android
    boundary UWP
    iOS <|-- React_Native
    Android <|-- React_Native
    Web <|-- React_Native
    UWP <|-- React_Native
    USER -- Web : UX
    USER -- iOS : UX
    USER -- Android : UX
    USER -- UWP : UX
}
note bottom of UX_XP : ネイティブアプリケーション\nクロスプラットフォーム用フレームワーク
@enduml
```
---
## バックエンドフォーフロントエンド(BFF)
``` plantuml
@startuml
skinparam monochrome true
skinparam handwritten true
skinparam defaultFontName "Yu Gothic UI, sans-serif"
package BFF_Client {
    class React
    class Apollo_Client
    React -> Apollo_Client
}
package BFF_Server {
    class NodeJS
    class Express
    Express <|-- NodeJS
    class Apollo_Server
    Express -> Apollo_Server
    class REST_API
    class Microservices
    class Databases
    Apollo_Server <-- REST_API
    Apollo_Server <-- Microservices
    Apollo_Server <-- Databases
}
Apollo_Client --> Express : GraphQL
@enduml
```
---
## マイクロサービス(MSA)
``` plantuml
@startuml
skinparam monochrome true
skinparam handwritten true
skinparam defaultFontName "Yu Gothic UI, sans-serif"
package BFF {}
package MSA {
    class NodeJS
    class Express
    note top
    ルーティング
    ミドルウェア
    テンプレートエラー処理
    デバッグ
    プロキシ連携
    データベース統合
    end note
    Express <|-- NodeJS
}
note top of MSA : 【主な特徴】\nサービスによるコンポーネント化\nビジネス機能に基づいた組織編成\nプロジェクトでなくプロダクト\nスマートエンドポイントと土管\n分割統治\n分散データ管理\nインフラストラクチャーの自動化\n障害・エラーを前提とした設計\n進化的な設計
BFF -> Express : REST
package DB {}
Express -> DB : SQL
@enduml
```
---
## データベース(DB)
``` plantuml
@startuml
skinparam monochrome true
skinparam handwritten false
skinparam defaultFontName "Yu Gothic UI, sans-serif"
package MSA
package DB {
    database Cassandra
    database Couchbase
    database CouchDB
    database LevelDB
    database MySQL
    database MongoDB
    database Neo4j
    database Oracle
    database PostgreSQL
    database Redis
    database SQL_Server
    database SQLite
    database Elasticsearch
}
note top of DB : DevOpsなJavaScript環境に適したもの
MSA -> DB : SQL
@enduml
```
---
## 凡例
    関連 (Association) -- : 関係あり(必須)
                       .. : 関係あり(オプション)
    集約 (Aggregation) o-- : 親子は別々の関係
    構成 (Composition) *-- : 親子は共存の関係
    一般化と継承 (Extension) <|-- : 共通と個別の関係
