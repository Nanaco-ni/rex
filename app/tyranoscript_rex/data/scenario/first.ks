; ノベルプラグイン 読み込み
[call target=*start storage="tyrano.ks"]
[cm]
;-----------------------------------------------------------------------------------------
;
; この first.ks では、
; ・タイトル画面の表示
; ・シナリオ選択画面
; ・コンフィグ画面
; を記述します。
;
;-----------------------------------------------------------------------------------------
*title_
[title name="ReX｜炎上ノベルゲーム"]
[cm]

[stopbgm]

; メッセージボックスを非表示にする
@layopt layer=message0 page=fore visible=false
@layopt layer=message0 page=back visible=false

; 背景の表示
[image layer=base page=fore storage=back_title.png]

; ロゴ配置
[image layer=1 width=800 y=350 storage=rogo_white@2x.png visible=true name="glink_center"]
[iscript]
$(".glink_center").css("left","50%");
$(".glink_center").css("transform","translateX(-50%)");
[endscript]

; はじめからボタン
[button target=*selectgame width=700 y=1300 graphic=start@2x.png name="glink_center"]
; MENU
[button name="menu_button" role="menu" width=300 x=740 y=40 graphic="menu@2x.png"]
[iscript]
$(".glink_center").css("left","50%");
$(".glink_center").css("transform","translateX(-50%)");
[endscript]
; ボタンを押すためにゲームを停止
[s]

;-----------------------------------------------------------------------------------------
*selectgame
; 初めからボタンが押されたとき
; ボタンをすべて消す
[cm]
; タイトルロゴを消す
[freeimage layer="1"]
; シナリオ1選択ボタン
[button width=700 y=360 graphic=s1@2x.png target=*scenario_01 name="glink_center"]
; シナリオ2選択ボタン
[button width=700 y=860 graphic=s2@2x.png target=*scenario_02 name="glink_center"]
; シナリオ3選択ボタン
[button width=700 y=1360 graphic=s3@2x.png target=*scenario_03 name="glink_center"]
[iscript]
$(".glink_center").css("left","50%");
$(".glink_center").css("transform","translateX(-50%)");
[endscript]
; 戻るボタン
[button x=20 y=1700 width= 200 height=200 graphic=config\c_btn_back2.png target=*title_]
[s]

;-----------------------------------------------------------------------------------------
; シナリオ1ボタンが押されたとき
; アイスケース炎上を読み込み
*scenario_01
[cm]
[call storage=story1.ks]

; シナリオ2ボタンが押されたとき
; スカスカおせち炎上を読み込み
*scenario_02
[cm]
[call storage=story2.ks]

; シナリオ3ボタンが押されたとき
; チョコレート虫混入炎上を読み込み
*scenario_03
[cm]
[call storage=story3.ks]

;-----------------------------------------------------------------------------------------
; インフォボタンが押されたとき
; インフォページを読み込み

;-----------------------------------------------------------------------------------------
; オプションボタンが押されたとき
; オプションページを読み込み
