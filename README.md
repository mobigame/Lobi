Lobi
====

ダウンロード
------------

バージョン毎のSDK及びサンプルコードがパッケージされたものが取得できます。  
[https://github.com/kayac/Lobi/releases](https://github.com/kayac/Lobi/releases)

登録
----

SDKを使用するにはアプリケーションの登録しクライアントIDを発行する必要があります。  
アプリケーションの登録は[https://developer.lobi.co/myapps](https://developer.lobi.co/myapps)から行ってください。

ドキュメント
-----------

ドキュメントは以下を確認してください  
[https://github.com/kayac/Lobi/wiki](https://github.com/kayac/Lobi/wiki)

リリースノート
----------------------------

- v5.0.17 - 2014/02/24
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.0.17.zip)
    - Siriの起動や着信が発生すると音声が再生されなくなる。  
    [https://github.com/kayac/Lobi/issues/53](https://github.com/kayac/Lobi/issues/53)  

- v5.0.16 - 2014/02/21
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.0.16.zip)
    - Cocos2d/Cocos2d-xにてアプリをバックグラウンドに落とすとBGMが出力されなくなる  
    [https://github.com/kayac/Lobi/issues/58](https://github.com/kayac/Lobi/issues/58)  
    - Cocos2d-xにてアプリをバックグラウンドに落とすとループしたSEが出力されなくなる  
    [https://github.com/kayac/Lobi/issues/59](https://github.com/kayac/Lobi/issues/59)  

- v5.0.15 - 2014/02/20
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.0.15.zip)
    - capturePerFrame の初期値を 3 に変更する。  
    [https://github.com/kayac/Lobi/issues/54](https://github.com/kayac/Lobi/issues/54)  
    - micEnable の初期値を NO とする  
    [https://github.com/kayac/Lobi/issues/55](https://github.com/kayac/Lobi/issues/55)  
    - 利用規約に同意してない場合の KLMDismissingPostVideoViewControllerNotification の tryPost は false とする。  
    [https://github.com/kayac/Lobi/issues/56](https://github.com/kayac/Lobi/issues/56)  

- v5.0.14 - 2014/02/19
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.0.14.zip)
    - 実況ワイプのvertex設定を画面スケールに依存させていた。  
    [https://github.com/kayac/Lobi/issues/50](https://github.com/kayac/Lobi/issues/50)  

- v5.0.13 - 2014/02/19
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.0.13.zip)
    - 録画終了時に gameSoundVolume を開始前の状態に自動的に戻す。  
    [https://github.com/kayac/Lobi/issues/48](https://github.com/kayac/Lobi/issues/48)  

- v5.0.12 - 2014/02/18
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.0.12.zip)
    - 同じ動画を再度投稿しようとした際の KLMDismissingPostVideoViewControllerNotification の tryPost は false とする。  
    [https://github.com/kayac/Lobi/issues/42](https://github.com/kayac/Lobi/issues/42)  
    - 投稿画面の「アプリに投稿」と「一緒に共有する」が逆になっている。  
    [https://github.com/kayac/Lobi/issues/43](https://github.com/kayac/Lobi/issues/43)  
    - Twitter 等の SNS シェアのログイン画面の表示時にインジケータを表示する。  
    [https://github.com/kayac/Lobi/issues/44](https://github.com/kayac/Lobi/issues/44)  
    - 動画一覧、詳細画面のチラツキを抑止する  
    [https://github.com/kayac/Lobi/issues/45](https://github.com/kayac/Lobi/issues/45)  

- v5.0.11 - 2014/02/17
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.0.11.zip)
    - Unity で設定している KLMDismissingPostVideoViewControllerObserver 内部で別のクラスを指定している。  
    [https://github.com/kayac/Lobi/issues/36](https://github.com/kayac/Lobi/issues/36)  
    - Category は文字列とする  
    [https://github.com/kayac/Lobi/issues/37](https://github.com/kayac/Lobi/issues/37)  
    - youtubeにもアップロードできるようにする  
    [https://github.com/kayac/Lobi/issues/38](https://github.com/kayac/Lobi/issues/38)  
    - 出力された動画をトリム出来るようにする  
    [https://github.com/kayac/Lobi/issues/39](https://github.com/kayac/Lobi/issues/39)  

- v5.0.9 - 2014/02/17
	[ダウンロード](https://github.com/kayac/Lobi/archive/v5.0.9.zip)
	- 動画投稿後のポップアップを非表示にするフラグを追加する  
	[https://github.com/kayac/Lobi/issues/33](https://github.com/kayac/Lobi/issues/33)  
	- 同じ動画を複数回上げることができてしまう。  
	[https://github.com/kayac/Lobi/issues/32](https://github.com/kayac/Lobi/issues/32)  

- v5.0.8 - 2014/02/13
	[ダウンロード](https://github.com/kayac/Lobi/archive/v5.0.8.zip)
	- 動画投稿時にアップロードが完了するまでにしばらく時間がかかることを表示する。  
	[https://github.com/kayac/Lobi/issues/24](https://github.com/kayac/Lobi/issues/27)  
	- iPod touch 第五世代で音が正しく扱えない  
	[https://github.com/kayac/Lobi/issues/25](https://github.com/kayac/Lobi/issues/28)  

- v5.0.7 - 2014/02/12
	[ダウンロード](https://github.com/kayac/Lobi/archive/v5.0.7.zip)
	- SDK 内の動画詳細から動画再生を押下後、動画読み込み中がわかるようにする。  
	[https://github.com/kayac/Lobi/issues/24](https://github.com/kayac/Lobi/issues/24)  
	- 動画シェア時にクリップボードに URL がコピーできない。  
	[https://github.com/kayac/Lobi/issues/25](https://github.com/kayac/Lobi/issues/25)  

- v5.0.6 - 2014/02/10
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.0.6.zip)
    - 録画終了時に組み込みアプリのパフォーマンスが一時的に悪くなる。  
    [https://github.com/kayac/Lobi/issues/5](https://github.com/kayac/Lobi/issues/5)  
    - ScoreID ではなく Category とする。  
    [https://github.com/kayac/Lobi/issues/17](https://github.com/kayac/Lobi/issues/17)  
    - Ranking となっているところを Rec に名称を統一する。  
    [https://github.com/kayac/Lobi/issues/19](https://github.com/kayac/Lobi/issues/19)  
    - Lobi/Line 投稿時の文言がわかりにくいので修正する。  
    [https://github.com/kayac/Lobi/issues/20](https://github.com/kayac/Lobi/issues/20)  

- v5.0.5 - 2014/02/06
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.0.5.zip)
	- 動画投稿時のバリデーション不正を修正  
	[https://github.com/kayac/Lobi/issues/15](https://github.com/kayac/Lobi/issues/15)  

- v5.0.4 - 2014/02/06
	- GLKit サンプルを追加
	- 横画面の投稿画面UIを改善  
	[https://github.com/kayac/Lobi/issues/11](https://github.com/kayac/Lobi/issues/11)  
	- 投稿画面でのSNS投稿UIを改善  
	[https://github.com/kayac/Lobi/issues/12](https://github.com/kayac/Lobi/issues/12)  
	- 投稿失敗時のステータスを通知するように修正  
	[https://github.com/kayac/Lobi/issues/13](https://github.com/kayac/Lobi/issues/13)  
	
- v5.0.3 - 2014/02/04
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.0.3.zip)
	- 録画開始時のパフォーマンス修正の影響を収束させるため、録音の初期化を同期処理に戻す。
	[https://github.com/kayac/Lobi/issues/1](https://github.com/kayac/Lobi/issues/1)  

- v5.0.2 - 2014/02/04
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.0.2.zip)
	- 横画面で動画投稿画面表示時にタイトル等の入力欄やプレビューが表示されないことがある問題を修正  
    [https://github.com/kayac/Lobi/issues/2](https://github.com/kayac/Lobi/issues/2)
    - 横画面で Twitter, Facebook の認証が縦画面の幅で表示される問題を修正  
    [https://github.com/kayac/Lobi/issues/3](https://github.com/kayac/Lobi/issues/3)
    - 動画リストのメニュー幅が横画面時正しく表示されない問題を修正  
	[https://github.com/kayac/Lobi/issues/6](https://github.com/kayac/Lobi/issues/6)

- v5.0.1 - 2014/02/04
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.0.1.zip)
    - 録画開始時に組み込みアプリのパフォーマンスが一時的に悪くなる問題を修正  
    [https://github.com/kayac/Lobi/issues/1](https://github.com/kayac/Lobi/issues/1)

- v5.0.0 - 2014/01/31
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.0.0.zip)
    - リリース


利用規約
------------
開発会社等利用規約  
[https://developer.lobi.co/terms/ja](https://developer.lobi.co/terms/ja)  

Terms of Use for Developers  
[https://developer.lobi.co/terms/en](https://developer.lobi.co/terms/en)  
