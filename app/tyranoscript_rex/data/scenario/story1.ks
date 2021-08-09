;------------------------------------------------------------------------------------------------------------------------------
; 準備

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
; 田中
[chara_new name=tanaka storage=tanaka1.png jname="田中"]
[chara_face name=tanaka face=normal storage=tanaka1.png]
[chara_face name=tanaka face=smile storage=tanaka_smile.png]
[chara_face name=tanaka face=sur storage=tanaka_surprise.png]
[chara_face name=tanaka face=sad storage=tanaka_sad.png]
; 店長
[chara_new name=tencho storage=tencho_dansei_01.png jname="店長"]
;----------------------------------------------------------------------------------------------------------
; 本文
;
; 背景の指定
; 背景画像は bgimage フォルダに置く必要があります
; 相対パスを使用して任意の場所を指定することもできます。
[back storage=town.jpg]
; BGMの指定
[playbgm storage=ReXrelax.ogg volume=40]
; #を付けると、メッセージ欄に名前を出すことができます。
; 20行目で jname="田中"を登録しているので、#tanaka とすると田中の名前表示がされます。
; 逆に名前を消したいときは # だけ記述してください。
#
#tanaka
; [p]はメッセージのクリア、クリック待ち、次メッセージの表示を一括で行う。
中山、そろそろバイト行くぞ！[p]
#
; キャラを表示
[chara_show name=tanaka height=1600 left=5 top=320]
; [l]でメッセージのクリック待ち
; [r]でメッセージの改行
こいつは友人の田中。[l][r]
バカやってて面白いヤツで、最近はSNSに凝り始めてる。[l][r]
なんでも、いいね？がつくのが嬉しいんだと。[p]
#tanaka
おい中山、聞いてんのか？[l][r]
早く行かねーと遅刻するぞ、店長にドヤされちまう。[p]
#
; キャラの退場
[chara_hide name=tanaka]
そうだな、ちょっと急ぐか。[p]
[back storage=conbini.jpg]
ありがとうございましたー！[p]
ふぅ、そろそろバイト上がりだな。[l][r]
今日は遅めにシフト入れたからもうこんな時間か。[p]
[chara_show name=tanaka height=1600 left=5 top=320]
#tanaka
なぁ、俺いいこと[r]思いついたんだけどさぁ！[p]
このアイスケースあるじゃん！[l][r]
これに入るから、写真撮ってくんねぇ？[l][r]
; 表情の変更
; 21行で登録した田中の smile を呼び出します。
#tanaka:smile
絶対バズると思うんだよな！[p]

*root_01
; 選択肢を表示させるときは、ゲームの進行をいったん止める
; [s] も記述してください。でないと選択肢が押せなくなります。
; 選択肢1
[glink y=200 width=800 height=55 size=50 text="おっ、面白そうじゃん！やるやる！" target=part1_label1 color="white" name="glink_center"]
; 選択肢2
[glink y=580 width=800 height=55 size=50 text="勝手にやっててくれ。" target=part1_label2 color="white" name="glink_center"]
; 選択肢3
[glink y=960 width=800 height=55 size=50 text="バカな事言ってないで帰るぞ！" target=part1_label3 color="white" name="glink_center"]
; 選択肢を中央揃えするjQuaryを実行
; g_link_centerの部分は選択肢内の name="" と一致させる必要があります。
[iscript]
$(".glink_center").css("left","50%");
$(".glink_center").css("transform","translateX(-50%)");
[endscript]
; 制限時間を利用するときには、[s]ではなく
; サブルーチンを[call]する。
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
; 制限時間の削除
[free layer="1" name="timer"]
#
[chara_hide name=tanaka]
カシャッ──[p]
[chara_show name=tanaka height=1600 left=5 top=320]
#tanaka
おっ、うまく撮れてんじゃんよぉ！[p]
#
しかしお前もヤバいこと思いつくよなぁ、俺には絶対できねぇわ。[p]
#tanaka
#tanaka:smile
ビビんなって！[r]バズるには度胸も必要なんだよ、[r]まぁ今回のはストーリーにアップするんだけどな。[p]
#
1番ビビってんのお前じゃねーかよ！[p]
#二人
ハハハ……[p]
#
[chara_hide name=tanaka]
[back storage=classroom.jpg]
翌日……[p]
学校終わったし、今日もバイト行くかって言いたいけど……[l][r]田中、学校休んでるんだよな……[p]
体調悪いようにも見えなかったけどな……[l][r]まさか、アイスケースに入ったせいで風邪ひいたのか？[p]
ん、電話……[l][r]バイト先から？[p]
; bgmを止める
[stopbgm]
[playbgm storage=ReXfire.ogg volume=40]
[chara_show name=tencho height=1600 left=500 top=320]
#店長
もしもし、中山くん？[l][r]田中くんに連絡つくかな。[p]
[chara_hide name=tencho]
#
え？あー……[r]アイツ、今日学校休んでますよ。[l][r]なんかあったんですか？[p]
[chara_show name=tencho height=1600 left=500 top=320]
#店長
いや、昨日ねぇ……[r]田中くんが店の冷凍庫に入ってふざけてる写真をSNSにアップしたみたいでねぇ。[p]
俗に言う炎上？ってやつで……[r]さっきから電話が鳴り止まないんだよ！[p]
……まったく、なんてことをしてくれたんだ……！[p]
[chara_hide name=tencho]
#
え、炎上……[l][r]ちょっと俺、今から田中の家行ってみます。[p]
[back storage=houses.jpg]
ﾋﾟﾝﾎﾟｰﾝ[p]
すみません、中山ですけど[p]
……誰も出ないな……[p]
どうしようか、店長の所に行ってみるか……？[p]

*root_02
; 選択肢1
[glink x=50 y=400 width=800 height=55 size=50 text="店長の所へ行く" target=part2_label1 color="white" name="glink_center]
; 選択肢2
[glink x=50 y=780 width=800 height=55 size=50 text="帰る" target=part2_label2 color="white" name="glink_center]
[iscript]
$(".glink_center").css("left","50%");
$(".glink_center").css("transform","translateX(-50%)");
[endscript]
; 制限時間を利用するときには、[s]ではなく
; サブルーチンを[call]する。
; [s]
[call target="*Sub_CountDownFive"]
; サブルーチンから return してきた
; (つまり選択肢が押されなかった)ときに、
; min～max までの乱数を用いて "part1_label{R}"
; ({R}にはrandの中身、今回は1～3が入る)に飛びます。
[getrandname name="part2_label{R}" min="1" max="2"]
[jump target="& tf.randname"]
;-------------------------------------------------------------------------------------------------------------------------------
; 分岐2-01
;
*part2_label1
[free layer="1" name="timer"]
[back storage=conbini.jpg]
店長、炎上って……[p]
[chara_show name=tencho height=1600 left=500 top=320]
#店長
あっ、中山くん！[l][r]監視カメラ確認したんだけど……[l][r]君、田中くんと一緒になってコレやってたよね？[p]
[chara_hide name=tencho]
#
……はい。[p]
[chara_show name=tencho height=1600 left=500 top=320]
#店長
……言葉も出ないよ、こういう事されると……[l][r]
君は写真を撮っただけとはいえ……[p]これはバイトテロだよ、立派な。[l][r]
炎上すると店に特定が入るから、さっきからずーっと電話が鳴りっぱなし。[p]
たぶんマスコミも来る……[l][r]いや、最悪閉店しかねないんだよ！[l][r]そうなったら僕の人生借金まみれなんだよ、分かる！？[p]
[chara_hide name=tencho]
#
……すみません[p]
[chara_show name=tencho height=1600 left=500 top=320]
#店長
……はぁ、[l][r]後先考える力を身につけて欲しい。[p]
それに特定されるのはこの店だけじゃない。[l][r]田中くんも……[r]君にも特定の魔の手が迫っていても何らおかしくはないんだぞ。[p]
[chara_hide name=tencho]
#
えっ、俺にもですか！？[l][r]俺は撮ってただけですよ！？[p]
[chara_show name=tencho height=1600 left=500 top=320]
#店長
ネットの特定っていうのは君が想像してる数倍恐ろしいんだよ。[l][r]
もう手遅れかもしれないけどね……[p]
はぁ……[l][r]もう帰ってくれないかな。[p]
[chara_hide name=tencho]
#
……すみませんでした[p]
@jump target=*part2_1c
[s]
;-------------------------------------------------------------------------------------------------------------------------------
; 分岐2-02
;
*part2_label2
[free layer="1" name="timer"]
[back storage=living_yu.png]
帰宅後……[p]
田中のやつ、大丈夫かな……[p]
メッセージ送っても反応ねぇし。[p]
モヤモヤしててもしょうがねぇや、[l][r]炎上どんな感じになってるのか見てみるか。[p]
[font size=70]
……なっ！！[p]
[font size=50]
これ、田中の顔写真と……名前、高校まで！？[l][r]な……特定ヤバすぎだろ！！[p]
お、俺の顔写真まである！なんでだ！？[p]
「撮影してるのはコイツじゃね？ケースに反射して映り込んでる顔と一致する」……[p]
…………[p]
[back storage=black.png]
は、いや……[l][r]そんな……[p]
ダメだ、胃が痛くなってきた……[p]
これは悪い夢だ……悪い夢……[l][r]早く寝よう……[p]
@jump target=*part2_1c
;-------------------------------------------------------------------------------------------------------------------------------
; エピローグ1
;
*part2_1c
[back storage=living_yu.png]
翌日……[p]
ダメだ……学校行く気にならねぇ……。[p]
田中からの返信はまだ来ない……[l][r]あいつも多分……[p]
[font size=70]
なんで俺がこんな目に遭うんだクソッ！！[p]
[font size=50]
ﾌﾟﾙﾙﾙﾙﾙﾙﾙ[p]
ッ〜〜こんな時に誰だよ！[l][r]
はい！どちら様ですか！[p]
#校長
もしもし、中山くん。[l][r]校長の白石です。[p]
#
こ、校長？[l][r]校長先生ですか？[p]
#校長
はい。今日は学校を休んでいるとのことなので、電話で。[l][r]……単刀直入に言いますが、バイトテロの件です。[p]
あんなことをするとは正直信じられませんが……[l][r]君たちがどれほど迷惑をかけているのか自覚していますか？[p]
君たちのせいで、今わが校にはイタズラ電話や抗議の電話がひっきりなしにかかってきます。[p]
朝からその対応に追われて職員室は最悪ですよ。[l][r]バイト先にも抗議の電話が殺到していると考えなさい。[p]
……君たちは3週間の停学処分になります。[l][r]しっかり頭を冷やしなさい。[p]
[back storage=classroom.jpg]
#
後日、親を含めて学校から呼び出しをくらい、改めて停学処分のお叱りを受けた。[p]
当然親からは怒られたし、殴られた。[l][r]情けないって。[p]
[back storage=conbini.jpg]
バイト先にも親と一緒に謝りに行ったけど、店長はマトモに取りあってくれなかった。[p]
ただ一言、[l]「君たちはクビだよ、……閉店しなくて済みそうなのが不幸中の幸いかな。[l]賠償請求されないだけマシだと思ってね」と言われた。[p]
[back storage=black.png]
田中とはあれから連絡を取れていないし、取る気もしない。[p]
田中の親から聞いた話だと、あの日以来部屋から出てこないらしい。[p]
──本当にバカなことをした。[l][r]ネットで本名を検索すれば、個人情報といっしょにこの炎上が付いてまわる。[p]
本当に軽い気持ちでやったことが、まるで毒みたいに蝕んでいくんだ──[p]
EP1 炎上 END[p]
[call storage=first.ks]

;-------------------------------------------------------------------------------------------------------------------------------
; 分岐1-02
;
*part1_label2
[free layer="1" name="timer"]
#
[chara_hide name=tanaka]
勝手にやっててくれ。炎上しても知らねーぞ[p]
[chara_show name=tanaka height=1600 left=5 top=320]
#tanaka
炎上？するわけないじゃん。[l][r]鍵付きのストーリーで友達向けに公開するだけだって、心配すんなよ[p]
#
俺はバックヤードに戻るからな。[l][r]馬鹿なことすんなよ！[p]
#tanaka
なんだあいつビビりやがって……[l][r]しゃーねー、セルフで撮れる角度探すか[p]
#
[chara_hide name=tanaka]
[back storage=classroom.jpg]
翌日……[p]
学校終わったし、今日もバイト行くかって言いたいけど……[l][r]田中、学校休んでるんだよな……[p]
体調悪いようにも見えなかったけどな……[l][r]まさか、アイスケースに入ったせいで風邪ひいたのか？[p]
ん、電話……[l][r]バイト先から？[p]
; bgmを止める
[stopbgm]
[playbgm storage=ReXfire.ogg volume=40]
[chara_show name=tencho height=1600 left=500 top=320]
#店長
もしもし、中山くん？[l][r]田中くんに連絡つくかな。[p]
[chara_hide name=tencho]
#
え？あー……[r]アイツ、今日学校休んでますよ。[l][r]なんかあったんですか？[p]
[chara_show name=tencho height=1600 left=500 top=320]
#店長
いや、昨日ねぇ……[r]田中くんが店の冷凍庫に入ってふざけてる写真をSNSにアップしたみたいでねぇ。[p]
俗に言う炎上？ってやつで……[r]さっきから電話が鳴り止まないんだよ！[p]
……まったく、なんてことをしてくれたんだ……！[p]
[chara_hide name=tencho]
#
え、炎上……[l][r]ちょっと俺、今から田中の家行ってみます。[p]
[back storage=houses.jpg]
ﾋﾟﾝﾎﾟｰﾝ[p]
すみません、中山ですけど[p]
……誰も出ないな……[p]
どうしようか、店長の所に行ってみるか……？[p]

; 選択肢1
[glink x=50 y=400 width=800 height=55 size=50 text="店長の所へ行く" target=part3_label1 color="white" name="glink_center]
; 選択肢2
[glink x=50 y=780 width=800 height=55 size=50 text="帰る" target=part3_label2 color="white" name="glink_center]
[iscript]
$(".glink_center").css("left","50%");
$(".glink_center").css("transform","translateX(-50%)");
[endscript]
; 制限時間を利用するときには、[s]ではなく
; サブルーチンを[call]する。
; [s]
[call target="*Sub_CountDownFive"]
; サブルーチンから return してきた
; (つまり選択肢が押されなかった)ときに、
; min～max までの乱数を用いて "part1_label{R}"
; ({R}にはrandの中身、今回は1～2が入る)に飛びます。
[getrandname name="part3_label{R}" min="1" max="2"]
[jump target="& tf.randname"]

*part3_label1
[free layer="1" name="timer"]
[back storage=conbini.jpg]
#
店長！[l][r]炎上って……[p]
[chara_show name=tencho height=1600 left=500 top=320]
#店長
あっ、中山くん！[l][r]昨日、田中くんとシフト一緒だったよね？[l][r]何があったの？[p]
[chara_hide name=tencho]
#
あー……[l][r]アイツ、自分がアイスケースに入るから写真撮ってくれって言ってきたんです。[p]
馬鹿なことはやめとけって言ったんですけど、俺がバックヤードにいる間にアイツ1人でやったみたいで……[p]
しかもそれを鍵付きとはいえSNSにアップしたみたいなんです。[l][r]それで流出したんだと……[p]
[chara_show name=tencho height=1600 left=500 top=320]
#店長
……うーん、まさかバイトテロを受けるとはなぁ……[l][r]さっきまでずっといたずら電話が止まらなくってね、電話線を抜いてあるんだけど…[p]
…この様子だと田中くんの方はもっとひどいかもしれないね。[p]
とりえず僕はこれから本社に連絡を入れる。[l][r]今日は営業やってる場合じゃないから、とりあえず店は閉めて……[p]
中山くんはアイスケースの清掃お願いできるかな？[p]
[chara_hide name=tencho]
#
わかりました。[l][r]すみません店長、俺がしっかり止めておけば……[p]
[chara_show name=tencho height=1600 left=500 top=320]
#店長
いや、管理が届いてなかった僕に責任がある。[l][r]まさかこんなことになるとは思ってなかったけどね……[p]
中山くんは真面目にやってくれてたのは知ってるよ。[p]
[chara_hide name=tencho]
#
本当にすみません。[l][r]俺からも田中に連絡取ってみます。[l][r]……田中はどうなるんですか？[p]
[chara_show name=tencho height=1600 left=500 top=320]
#店長
クビなのは確定だね……。[l][r]今後の経営がどうなるか分からないけど、最悪……賠償請求の事も考えないといけないと思ってる。[p]
[chara_hide name=tencho]
#
賠償……[p]
……じゃあ俺、清掃やってきます。[p]
[chara_show name=tencho height=1600 left=500 top=320]
#店長
清掃やったら帰ってくれて大丈夫だよ。[l][r]尻ぬぐいで悪いけど……頼むね。[p]
[chara_hide name=tencho]

@jump target=*part3_1c

*part3_label2
[free layer="1" name="timer"]
[back storage=living_yu.png]
#
帰宅後……[p]
田中、本当に大丈夫かな……。[l][r]炎上してるって言ってたな、ちょっと見てみるか。[p]
……！！[l][r]これ、田中の顔写真と本名……！[p]
それだけじゃねえ、バイト先、学校まで特定されてる……！[p]
マジかよ、こいつ住所も特定するとか言ってるぞ！[p]
アイツ鍵付きアカウントだったから、普通の人は見れないのに……[l][r]誰かが流出させたんだな。[p]
……流出させた側は匿名のままで、田中は特定されて……[l][r]クソすぎる……！[p]

@jump target=*part3_1c

*part3_1c
[back storage=black.png]
#
ずっと心の中にモヤみたいなものが残っていて、その日は眠れなかった。[p]
田中を止められなかった罪悪感のせいか？[l][r]それとも、炎上を身近に感じた恐怖心か？[p]
……「自分は助かった」って心のどこかで思ってしまっている自分もいる。[l][r]クソ、寝つきが悪い……[p]
翌日……[p]
[back storage=classroom.jpg]
次の日も田中は学校に来なかった。[p]
何度か田中の家に行ってみても応答はなく、メッセージも返ってこなかった。[p]
後日、田中は学校を辞めた。[l][r]そのころにはもう一連の炎上はもう下火になり、田中の個人情報を特定していた人たちは次の獲物を求めて目をギラつかせているみたいだった。[p]
ただ、田中の個人情報はネットの海に残ったままだ。[l][r]消えることはない。[p]
[back storage=conbini.jpg]
バイト先は何とか閉店を免れた。[p]
事実確認や従業員の再教育など、本社の素早い対応によって、以前までとはいかないものの何とか企業イメージの維持はできたらしい。[p]
でも、それにかかった費用として田中に賠償請求がいったことも聞いた。[p]
店長によると、示談が成立したから額面通りの賠償金ではないらしいが、それでも数百万円はくだらないとのことだった。[p]
軽い気持ちでやったことが一生自分を苦しめる。[l][r]それを身近に感じた数日だった。[p]
EP2 傍観者 END[p]
[call storage=first.ks]
;-------------------------------------------------------------------------------------------------------------------------------
; 分岐1-03
;
*part1_label3
[free layer="1" name="timer"]
#
[chara_hide name=tanaka]
なぁ、お前炎上って知らないのか？[l][r]馬鹿な事すんなよ！[p]
[chara_show name=tanaka height=1600 left=5 top=320]
#tanaka
なんだよ、いきなりキレるじゃん。[l][r]ちょろっと入って撮るだけだっての。[p]
#
あのな、そういう軽い気持ちで炎上したヤツがこの世にはごまんといるんだよ。[l][r]賠償金払いたくないだろ？[p]
#tanaka:sur
賠償金？訴えられんのかよ！？[p]
#
当たり前だろ！[l][r]会社のイメージを落としてるんだから！[p]
それとか、あとは将来的に就職するときにそういう過去の炎上歴を調べられて、面接すらさせてもらえないらしいぞ。[p]
#tanaka:sad
……デメリットの方がデカいじゃねぇかよ……[l][r]わかったわ、なんか面白くなくなったしやめるか……[p]
#
バカタレ、面白さ云々抜きにしてやっちゃダメなの！[p]
#tanaka:normal
ういうい、忠告ありがとさんっと。[l][r]そうだな、もっと人サマに胸張れることでバズるわ。[p]
#
そうそう、そういうことなら俺も手伝うぜ。[l][r]人に迷惑かけちゃだめだ。[p]
#tanaka
と、バカ話してたらもうシフト終わりじゃんよ。[l][r]引継ぎやって帰るかぁ。[p]
#
そうだな。[r]今日もお疲れさんと。[l][r]じゃあまた明日な！[p]
[chara_hide name=tanaka]

[back storage=classroom.jpg]
翌日……[p]
学校の正門前に数人の記者らしき人が詰めかけていた。[p]
「昨日、柏木っていうおたくの生徒さんがバイトテロを起こしたらしいですけど！何かご存知ですか！？」[p]
「コメントお願いします！柏木くんとは仲良かったんですか？」[p]
「学校での素行はどのような感じでしたか！？」[p]
どうやら、俺たちがアイスケースでひと悶着している間に、別の場所で柏木と言う生徒がバイトテロを起こしていたらしい。[p]
クラスはその話題で持ちきりだった。[l][r]すでにバイト先、学校、顔写真、本名などいろいろな個人情報が特定されているらしい。[p]
[chara_show name=tanaka height=1600 left=5 top=320]
#tanaka:sad
中山、もしかして俺ってこうなってたかもしれないの？[p]
#
そういうことだな。[l][r]……柏木には悪いけど、お前の反面教師だよ。[p]
#tanaka
怖～……[l][r]俺こんなの耐えられねぇと思う。[l][r]昨日止めてくれて本当にありがとうな。[p]
#
いいよ、逆に俺がなんかやらかしそうになってたらお前が止めてくれよな。[p]
#tanaka:smile
おう、任せとけ！[l][r]……って言っても信用ねぇか。[p]
[chara_hide name=tanaka]
[back storage=black.png]
#
記者による突撃取材はその後一週間ほど続いた。[p]
日が経つにつれ炎上は下火になっていったが、柏木の個人情報はたぶんネットから消えていない。[p]
……一歩間違えればこういう結末になっていたと思うと、身が震えた。[p]
EP3 対岸の火事 END[p]

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