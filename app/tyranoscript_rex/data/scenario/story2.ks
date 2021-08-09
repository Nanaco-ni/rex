;------------------------------------------------------------------------------------------------------------------------------
; 準備
;
; マクロの準備
[call storage="macro.ks"]
*start
; レイヤー1に配置されている画像を消す
[freeimage layer=1]
; 画面のクリア
[cm]
; メッセージウィンドウのサイズ設定
[position layer=message0 top=1420 height=500 page=fore visible=true]
; メッセージ表示位置の調整
[position layer=message0 page=fore margint=100 marginl=50 marginr=50 marginb=100]
; メッセージウィンドウの有効化
@layopt layer=message0 visible=true
; メッセージウィンドウに名前表示エリアを確保
[ptext name=chara_name_area layer=message0 width=400 color=white x=50 y=1440 size=60]
[chara_config ptext="chara_name_area"]
; 登場するキャラを登録
; 父親
[chara_new name=father storage=syain_dansei_02.png jname="父親"]
; 母親
[chara_new name=mother storage=josei_03.png jname="母親"]
; オペレーター
[chara_new name=operator storage=syain_josei_02.png jname="オペレーター"]
;------------------------------------------------------------------------------------------------------------------------------
; 本文
;
[back storage=living.png]
3...2...1...[l][r]あけましておめでとうー！！[p]
;
; BGMの指定
[playbgm storage=ReXrelax.ogg volume=40]
#
; [l]でメッセージのクリック待ち
; [r]でメッセージの改行
今日は12月31日……[l][r]から1日経って1月1日。[l][r]
そう、お正月である。[p]
我が家では毎年、家族揃っておせちを食べることが正月の恒例行事になっている。[r]
その後、初詣に行きお年玉をもらう。[p]
う〜ん、最高だな……[l][r]
と、新年気分惜しいがそろそろ寝るか。[l][r]新年早々夜更かしばっかりしてられないしな。[p]
じゃあ俺そろそろ寝るよ。おやすみ。[p]
[back storage=living_hiru.png]
#
翌日......[p]
おはよ〜、よく寝たわ。[p]
居間が何やら騒がしい。[p]
どうしたの？[p]
;
;バーンみたいなSE
;
;スカスカのおせちのイラスト
; [image name="osechi" layer="1" storage=osechi.jpg x= y= width=]
……うわっ！何これ、食べかけ？[p]
そこにあったのは、商品イメージ図とは似ても似つかぬ無惨なおせちの姿だった。[p]

; 母親
[chara_show name=mother height=1600 left=5 top=320]
;
#mother
これ、ネットで注文したやつなんだけど……[l][r]
まさかこんな中身とはねぇ……[p]
; 父親の立ち絵
[chara_show name=father height=1600 left=500 top=320]
#father
詐欺商品じゃないか！まったく……[p]
; キャラの退場
[chara_hide_all]
; [chara_hide name=father]
#
うーん。困ったな……。[l][r]
仕方がないからとりあえず……。[p]
;
*root_01
; 選択肢を表示させるときは、ゲームの進行をいったん止める
; [s] も記述してください。でないと選択肢が押せなくなります。
; 選択肢1
[glink y=200 width=800 height=55 size=50 text="公式お問い合わせに電話する" target=part1_label1 color="white" name="glink_center"]
; 選択肢2
[glink y=580 width=800 height=55 size=50 text="消費者センターに電話する" target=part1_label2 color="white" name="glink_center"]
; 選択肢3
[glink y=960 width=800 height=55 size=50 text="SNSで注意喚起する" target=part1_label3 color="white" name="glink_center"]
; 選択肢を中央揃えするjQuaryを実行
; g_link_centerの部分は選択肢内の name="" と一致させる必要があります。
[iscript]
$(".glink_center").css("left","50%");
$(".glink_center").css("transform","translateX(-50%)");
[endscript]
; [s]
[call target="*Sub_CountDownFive"]
; サブルーチンから return してきた
; (つまり選択肢が押されなかった)ときに、
; min～max までの乱数を用いて "part1_label{R}"
; ({R}にはrandの中身、今回は1～3が入る)に飛びます。
[getrandname name="part1_label{R}" min="1" max="3"]
[cm]
[jump target="& tf.randname"]
;-------------------------------------------------------------------------------------------------------------------------------
; 分岐1-01
;
*part1_label1
[free layer="1" name="timer"]
#
流石にクレームものでしょ。俺ちょっと販売元に電話してみるよ。[p]
#
ﾌﾟﾙﾙﾙﾙﾙ[l][r]
ﾌﾟﾙﾙﾙﾙﾙ[l][r]
ﾌﾟﾙﾙﾙﾙﾙ[p]
#
……おかしい、出ないな。[r]
もしかしたら、他の注文も全部こんな感じで、電話が殺到してるのかもしれないな。[p]
公式ホームページは……やっぱり繋がらないか。[r]
たぶんサーバーがダウンしてるんだな。[p]
ちょっと俺、もう1回電話してみるか。[p]
#
ﾌﾟﾙﾙﾙﾙﾙ[l][r]
ﾌﾟﾙﾙﾙﾙﾙ[l][r]
ﾌﾟﾙﾙﾙﾙﾙ[p]
[chara_show name=operator height=1600 left=500 top=320]
#operator
はい、もしもし。こちらカスタマーサービスでございます。[p]
[chara_hide name=operator]
#
！[l][r]繋がった！[l][r]
あー……っと、先日そちらで買わせていただいたおせちについてなんですが……[p]
[chara_show name=operator height=1600 left=500 top=320]
#operator
はい……。大変申し訳ございません。[p]
あのようなモノをお客様にご提供してしまったこと、心よりお詫び申し上げます。[p]
補填につきましては、後日ご自宅までお伺いさせて頂き、そこで返金という形になります。[p]
お届けした商品はお好きなように処分して頂いて構いません。[p]
[chara_hide name=operator]
#
慣れてる感じがする……[l][r]何回も言わなきゃいけないほどに抗議が殺到してるのかな。[p]
こんなこと聞くのもアレなんですけど……やっぱり電話って殺到してるんですか？[p]
[chara_show name=operator height=1600 left=500 top=320]
#operator
……そうですね。現在対応に追われている状況でございます。[p]
[chara_hide name=operator]
#
この電話口の人は悪くないんだし、強く当たる気にもなれないな……[l][r]
はい、わかりました。[l][r]……あの、頑張ってください。では失礼します。[p]
ｶﾞﾁｬ[p]
母さん、後日家まで返金に来るって。[r]これは好きなように処分して構わないってさ。[p]
[chara_show name=mother height=1600 left=500 top=320]
#mother
好きなようにって言われてもねぇ……[r]
これじゃあ、あんまり新年開けた気にならないわね。[p]
[chara_hide name=mother]
[chara_show name=father height=1600 left=500 top=320]
#father
じゃあ、今から初詣に行って、帰りにどっかで食べよう。[l][r]
それでパーッと気分さわやかに新年を迎えよう。な？[p]
[chara_hide name=father]
#
そうしよっか。[p]

@jump target=*part2
;-------------------------------------------------------------------------------------------------------------------------------
;
; 分岐1-02
;
*part1_label2
[free layer="1" name="timer"]
#
こういうのって普通に詐欺なんじゃないの？[p]
[chara_show name=father height=1600 left=500 top=320]
#father
景品表示法に引っかかってるかもしれないな。[r]
消費者センターに電話してみるか。[p]
#
ﾌﾟﾙﾙﾙﾙ……[p]
#father
色んな人から報告が来てて、優良誤認？に当てはまるかもしれないらしい。[p]
[chara_hide name=father]
#
……あ、SNSでお知らせしてる。後日、自宅まで返金しに来るって。[p]
[chara_show name=mother height=1600 left=500 top=320]
#mother
後日って言っても、いつになるのかしらねぇ。[p]
[chara_hide name=mother]
[chara_show name=father height=1600 left=500 top=320]
#father
ちょっと早いけど、今日はもう初詣に行って、帰りにどっかでご飯食べるか。[r]
新年からこんな陰鬱じゃ味気ないもんな。[p]
[chara_hide name=father]
#
うん、そうしよっか。[p]

@jump target=*part2
;-------------------------------------------------------------------------------------------------------------------------------
;
; 分岐1-03
;
*part1_label3
[free layer="1" name="timer"]
#
注意喚起も含めて、SNSにアップしてみるか。[p]
ちょっと俺、注意喚起も含めてSNSに投稿してみるよ。[p]
[chara_show name=mother height=1600 left=500 top=320]
#mother
やっぱり、他の人もこういう感じなのかしら。酷い話ねぇ。[p]
[chara_hide name=mother]
[chara_show name=father height=1600 left=500 top=320]
#father
どうかなぁ。[r]
ま、今日はもう初詣に行って、帰りにどっかで食べよう。もういい時間だし。[p]
[chara_hide name=father]
#
そうしよっか。[p]

@jump target=*part2
;-------------------------------------------------------------------------------------------------------------------------------
;
; 共通分岐
;
*part2
[back storage=town.jpg]
[chara_show name=father height=1600 left=500 top=320]
#father
正月から洋食を食うのも悪くないな。なんかこう……和洋折衷みたいな感じで。[p]
[chara_hide name=father]
#
それはちょっと違う気がするけど。[p]
[chara_show name=mother height=1600 left=500 top=320]
#mother
帰りにデパートに行って、おせちがあったら買って、もう1回仕切り直しましょうか。[p]
[chara_hide name=mother]
[chara_show name=father height=1600 left=500 top=320]
#father
それがいいな。[l][r]
洋食も悪くないが、やっぱり気分的におせちを食べないと新年って気分にならないしな。[p]
[chara_hide name=father]
#
ちょっと大袈裟だけど、わからなくもないかな。[p]
[back storage=living.png]
#
その日の夜……[p]
さて、おせちも食べたし。[r]
今朝のアレ、どうなったかな。結構燃えてそうだけど。[p]
ふむ、やっぱり色んな人が呟いてるな……腐ってたのが届いた人もいるな。[r]
公式アカウントがお知らせしてる。[p]
後日返金、おせちは処分してくれ……か、案の定コメント欄が批判まみれだな。[p]
[chara_show name=father height=1600 left=500 top=320]
#father
なぁ、ちょっといいか？[p]
#
ん、どうしたの？[p]
#father
いや、SNSを見てて思ったんだがな……[l][r]
父さんたちが文句を言うのはわかるぞ、なんてったって被害者だからな。[p]
でも、SNSで知った情報だけで批判してる人が多いように思えてな。[l][r]
お前、こういうの詳しいだろ？ちょっと教えてもらえないか？[p]
#
あー、そこが炎上の悪いところなんだよね。[l][r]
匿名だから、自分に関係ないことでも、みんな正義感だけで暴言を吐くんだよ。[p]
#father
うーん、そんなもんなのか……[p]
#
うん、そうだよ。[l][r]
……見てこれ。さっき、俺のアカウントであのおせちを呟いたんだけど、「わざわざアップしなくていいだろ！」ってコメントを送ってる人。[p]
……何にキレてるんだって感じ。この人は傍観者なのにね。[p]
#father
色んな人がいるんだな、世の中には。[r]イライラしたりしないのか？[p]
#
こういう事を言ってる人はほんの一部だからね。[r]まぁちょっとムッとするけど。[p]
#father
達観してるんだなぁ。[r]なるほどな。炎上って怖いんだなぁ……[p]
[chara_hide name=father]

@jump target=*part3
;-------------------------------------------------------------------------------------------------------------------------------
;
; エピローグ
;
*part3
[back storage=living_hiru.png]
#
2日後、企業の人が返金に来た。[r][l]
迷惑料込みらしく、買った値段よりも多かった。[p]
景品表示法違反として、問題の企業には消費者庁から措置命令が入った。[r][l]
その責任を取って社長が辞任したらしい。[p]
案の定、SNSには大量に批判コメントや暴言が飛び交い、近年稀に見るほどの炎上になっていた。[p]
今回の件みたいに、炎上は時として企業の不正を暴くこともある。[r][l]
……でも、父さんも言ってたみたいに関係ない人が便乗して、必要以上に燃える。[p]
ちょっと同情しちゃうな……。[p]
EP おせちスカスカ事件 END[p]
[call storage=first.ks]
[s]

;----------------------------------------------------------------------------------------------------------------------------------
*Sub_CountDownFive
;----------------------------------------------------------------------------------------------------------------------------------
; 5秒カウントダウンしてからリターンする、サブルーチンラベルです。
; [keyframe]～[endkeyframe]
; 拡縮するキーフレームアニメーション。
[keyframe name="kanim_timer"]
[frame p=" 0%" scale="1.2"]
[frame p=" 20%" scale="1"]
[endkeyframe]

; 吹き出し画像の表示
[image name="timer" layer="1" storage="timer.png" x="390" y="1200" width="300"]

; 吹き出し画像の上に文字を表示
[ptext name="timer,timer_text" layer="1" text="5" size="100" x="505" y="1235" color="0x000000" bold="bold" edge="0x000000"]

; [wait]
; 文字を出す処理と画像を出す処理の完了を確実に待つため、1ミリ秒待ちます。
; 深い意味はないです。
[wait time="1"]

; [kanim]
; 1ループあたり長さ1秒で、永久にループするキーフレームアニメーションを適用します。
[kanim name="timer" time="1000" keyframe="kanim_timer" count="infinite"]

; [wait][ptext]×4
; 1秒待つ→ptextでテキストを書き換えることを繰り返します。
; name="timer_text" overwrite="true" に着目してください！
; これを指定することで、新規のptextオブジェクトの作成を行わず、
;「既存のptextオブジェクトの内容の書き換え」が行えます。
[wait time="1000"]
[ptext text="4" overwrite="true" name="timer_text" layer="1" x="0" y="0" color="0x000000" bold="bold" edge="0x000000"]
[wait time="1000"]
[ptext text="3" overwrite="true" name="timer_text" layer="1" x="0" y="0" color="0x000000" bold="bold" edge="0x000000"]
[wait time="1000"]
[ptext text="2" overwrite="true" name="timer_text" layer="1" x="0" y="0" color="0x000000" bold="bold" edge="0x000000"]
[wait time="1000"]
[ptext text="1" overwrite="true" name="timer_text" layer="1" x="0" y="0" color="0x000000" bold="bold" edge="0x000000"]
[wait time="1000"]
; [free]
; 5秒待ちましたので、[image][ptext]で出した画像とテキストを削除します。
[free layer="1" name="timer"]

; [return]
; このラベルはサブルーチンとして呼ばれますので、
; 最後にリターンでもとの場所に帰ります。
[return]