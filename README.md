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

- [https://github.com/kayac/Lobi/wiki](https://github.com/kayac/Lobi/wiki)  
- [Lobi SDK Reference](http://kayac.github.io/Lobi/iOS/LobiSDK/LobiReference/index.html)  



リリースノート
----------------------------
- v5.2.21 - 2014/05/22
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.2.21.zip)
    - iOS でカスタムスキーマが正しく設定されていない場合に info.plist に表示すべき項目がログに出力されない  
     [https://github.com/kayac/Lobi/issues/146](https://github.com/kayac/Lobi/issues/146)  
    - Lobiの画面が閉じているときでもオフライン状態のエラーが表示されてしまう。  
     [https://github.com/kayac/Lobi/issues/148](https://github.com/kayac/Lobi/issues/148)  
    - 1on1チャットのLobiAPIインターフェイスを追加。  
     [https://github.com/kayac/Lobi/issues/147](https://github.com/kayac/Lobi/issues/147)  

- v5.2.20 - 2014/05/15
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.2.20.zip)
    - UnityLandscapeアプリにて、メニューが表示されない故障を修正

- v5.2.19 - 2014/05/14
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.2.19.zip)
    - iOS Unity サンプルに置いてチャットシーンのスクリプトが正しくアタッチされていない  
     [https://github.com/kayac/Lobi/issues/142](https://github.com/kayac/Lobi/issues/142)
    - Android Rec cocos2d-x サンプルの追加  
     [https://github.com/kayac/Lobi/issues/143](https://github.com/kayac/Lobi/issues/143)  
    - ネットワークに接続されていない状態でRankingを取得するAPIを実行するとクラッシュする。  
     [https://github.com/kayac/Lobi/issues/144](https://github.com/kayac/Lobi/issues/144)    
    
- v5.2.18 - 2014/05/09
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.2.18.zip)
    - 動画投稿時にキーボードが閉じない。   
     [https://github.com/kayac/Lobi/issues/138](https://github.com/kayac/Lobi/issues/138)
    - Lobi本体アプリとの連携ボタンを押した際の挙動が不正。  
     [https://github.com/kayac/Lobi/issues/139](https://github.com/kayac/Lobi/issues/139)
    
- v5.2.17 - 2014/05/07
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.2.17.zip)
    - Unity のドキュメントと実装に差異がある    
    [https://github.com/kayac/Lobi/issues/135](https://github.com/kayac/Lobi/issues/135)

- v5.2.16 - 2014/05/02
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.2.16.zip)
    - フレームワークによる設定項目の変更を汎化    
    [https://github.com/kayac/Lobi/issues/132](https://github.com/kayac/Lobi/issues/132)
    - ハッシュタグと画像を同時に投稿するとレイアウトが崩れる問題に対応  
    [https://github.com/kayac/Lobi/issues/133](https://github.com/kayac/Lobi/issues/133)

- v5.2.15 - 2014/04/28
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.2.15.zip)
    - Android の追加

- v5.2.14 - 2014/04/28
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.2.14.zip)
    - x86_64の追加、"Debug Information Format"の項目を"DWARF"に変更   
    [https://github.com/kayac/Lobi/issues/129](https://github.com/kayac/Lobi/issues/129)
    
- v5.2.13 - 2014/04/25
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.2.13.zip)  
	- 外部ID利用時のアカウント情報の更新  
	[https://github.com/kayac/Lobi/issues/127](https://github.com/kayac/Lobi/issues/127)  

- v5.2.12 - 2014/04/23
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.2.12.zip)  
	- i386をframeworkに追加  
	[https://github.com/kayac/Lobi/issues/125](https://github.com/kayac/Lobi/issues/125)  
    - 外部ID利用時のアカウント情報取得対応  
	[https://github.com/kayac/Lobi/issues/123](https://github.com/kayac/Lobi/issues/123) 
	- プロフィール編集時のエラーアラート表示不正  
	[https://github.com/kayac/Lobi/issues/126](https://github.com/kayac/Lobi/issues/126) 

- v5.2.11 - 2014/04/22
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.2.11.zip)  
    - マイクプライバシー設定の状態を取得できるIF追加  
	[https://github.com/kayac/Lobi/issues/121](https://github.com/kayac/Lobi/issues/121) 


- v5.2.10 - 2014/04/21
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.2.10.zip)  
    - iPadにてLobiPlay参照時の表示不正  
	[https://github.com/kayac/Lobi/issues/119](https://github.com/kayac/Lobi/issues/119) 


- v5.2.9 - 2014/04/18
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.2.9.zip)  
    - ナビゲーションバーとチャットビュー背景カスタマイズのUnity対応  
	[https://github.com/kayac/Lobi/issues/116](https://github.com/kayac/Lobi/issues/116) 
	- プロフィール画面の編集ボタンが表示されない問題  
	[https://github.com/kayac/Lobi/issues/117](https://github.com/kayac/Lobi/issues/117) 

- v5.2.8 - 2014/04/17
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.2.8.zip)
    - ナビゲーションバー（ヘッダー）の背景色のカスタマイズ、チャット画面の背景色カスタマイズ機能の追加  
	[https://github.com/kayac/Lobi/issues/113](https://github.com/kayac/Lobi/issues/113) 
	
- v5.2.7 - 2014/04/16
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.2.7.zip)
    - iPadでのチャット表示が崩れる  
    [https://github.com/kayac/Lobi/issues/111](https://github.com/kayac/Lobi/issues/111)  
    - landscape表示時、メニューが逆からスライドする  
    [https://github.com/kayac/Lobi/issues/110](https://github.com/kayac/Lobi/issues/110)

- v5.2.6 - 2014/04/11
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.2.6.zip)  
    - SDK アプリ内ユーザー名の更新を反映させる  
    [https://github.com/kayac/Lobi/issues/108](https://github.com/kayac/Lobi/issues/108)  
    - 過去のバージョンのSDKも含める  
    [https://github.com/kayac/Lobi/issues/107](https://github.com/kayac/Lobi/issues/107)  
    - Lobi投稿画面にてソフトキーボード開いた後SNS導線が反応しなくなる  
    [https://github.com/kayac/Lobi/issues/106](https://github.com/kayac/Lobi/issues/106)  


- v5.2.5 - 2014/04/10
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.2.5.zip)  
    - 英語でローカライズされた友だち削除のラベルがプレースホルダのまま  
    [https://github.com/kayac/Lobi/issues/104](https://github.com/kayac/Lobi/issues/104)  

- v5.2.4 - 2014/04/09
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.2.4.zip)  
    - iOS 6.x以下のバージョンにて正しくナビゲーションバーが表示されない  
    [https://github.com/kayac/Lobi/issues/102](https://github.com/kayac/Lobi/issues/102)  


- v5.2.3 - 2014/04/09
    - Unityサンプルの更新 
    - ココそこ機能のポインタを改修 

- v5.2.2 - 2014/04/09
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.2.2.zip)  
    - Unityパッケージの追加  

- v5.2.1 - 2014/04/08
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.2.1.zip)  
    - Unityモジュール化対応  
    [https://github.com/kayac/Lobi/issues/96](https://github.com/kayac/Lobi/issues/96)  


- v5.2.0 - 2014/04/07
    - iOS LobiSDKモジュール化  
    [https://github.com/kayac/Lobi/issues/90](https://github.com/kayac/Lobi/issues/90)  
    - キャプチャ中任意の時点でサムネイルが取得できるようにする  
    [https://github.com/kayac/Lobi/issues/74](https://github.com/kayac/Lobi/issues/74)  

----------------------------

- v5.1.11 - 2014/04/07
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.1.11.zip)  
    - 投稿画面のSNSシェア導線を改修  
    [https://github.com/kayac/Lobi/issues/88](https://github.com/kayac/Lobi/issues/88)  

- v5.1.10 - 2014/04/02
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.1.10.zip)  
    - アフレコ終了時、録画終端あたりが切れている  
    [https://github.com/kayac/Lobi/issues/86](https://github.com/kayac/Lobi/issues/86)  

- v5.1.9 - 2014/03/28
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.1.9.zip)  
    - プレビュー時自動でUIをフェードアウトさせる  
    [https://github.com/kayac/Lobi/issues/84](https://github.com/kayac/Lobi/issues/84)  
    - アフレコ時の動画表示不正  
    [https://github.com/kayac/Lobi/issues/83](https://github.com/kayac/Lobi/issues/83)  

- v5.1.8 - 2014/03/27
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.1.8.zip)  
    - setDesignResolutionSize時、描画が正しく行われない  
    [https://github.com/kayac/Lobi/issues/81](https://github.com/kayac/Lobi/issues/81)  

- v5.1.7 - 2014/03/14
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.1.7.zip)  
    - 動画一覧を開く際に プロフィール画面 を設定できるようにする  
    [https://github.com/kayac/Lobi/issues/79](https://github.com/kayac/Lobi/issues/79)  

- v5.1.6 - 2014/03/11
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.1.6.zip)  
    - iOS 6.x以下のバージョンにて正しく録画処理がされない  
    [https://github.com/kayac/Lobi/issues/77](https://github.com/kayac/Lobi/issues/77)  

- v5.1.5 - 2014/03/10
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.1.5.zip)  
    - Unity で OnGUI でボタン等を表示している場合に録画を始めると真っ暗になる。  
    [https://github.com/kayac/Lobi/issues/22](https://github.com/kayac/Lobi/issues/22)  

- v5.1.4 - 2014/03/07
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.1.4.zip)  
    - 録画後実況を入れられるようにする  
    [https://github.com/kayac/Lobi/issues/62](https://github.com/kayac/Lobi/issues/62)  
	- KLMPlayWebViewControllerにcompletionBlockを追加  
    [https://github.com/kayac/Lobi/issues/65](https://github.com/kayac/Lobi/issues/65)  
	- KLMPostVideoViewControllerにcompletionBlockを追加  
    [https://github.com/kayac/Lobi/issues/66](https://github.com/kayac/Lobi/issues/66)  

- v5.1.3 - 2014/03/07
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.1.3.zip)  
    - ClippingNodeを利用時、録画表示が不正になる問題を修正  
    [https://github.com/kayac/Lobi/issues/70](https://github.com/kayac/Lobi/issues/70)  

- v5.1.2 - 2014/03/06
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.1.2.zip)  
    - トリミングボタンを初期化時に非表示とする  
    [https://github.com/kayac/Lobi/issues/68](https://github.com/kayac/Lobi/issues/68)  

- v5.1.1 - 2014/03/05
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.1.1.zip)  
    - 録画後実況機能を一時的に取り外す  

- v5.1.0 - 2014/02/28
    [ダウンロード](https://github.com/kayac/Lobi/archive/v5.1.0.zip)  
    - 録画後実況を入れられるようにする。  
    [https://github.com/kayac/Lobi/issues/62](https://github.com/kayac/Lobi/issues/62)  
    - ゲーム中の音やマイクは取得できるが Unity のサンプルではうまくいかない。  
    [https://github.com/kayac/Lobi/issues/16](https://github.com/kayac/Lobi/issues/16)  

> **NOTE**  
> Unity版の5.0.x バージョンから更新する場合は全てのファイルの更新及び[KLR_set_unity_pause_funcの呼び出し](https://github.com/kayac/Lobi/wiki/Unity-LobiRecSDK-Docs#wiki-2.10)を行う必要があります。
    
----

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
