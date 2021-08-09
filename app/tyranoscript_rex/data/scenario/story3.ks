;------------------------------------------------------------------------------------------------------------------------------
; 準備
;
*start
; マクロの準備
[call storage="macro.ks"]
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
[ptext name=chara_name_area layer=message0 width=800 color=white x=50 y=1440 size=60]
[chara_config ptext="chara_name_area"]
; 登場するキャラを登録
; 田中取締役
; ハルコ部長
; ユーコ製造部長
; 田中(笑)マーケティング部長
; REX社長

[chara_new name=tor storage=syain_dansei_01.png jname="取締役"]
[chara_new name=mbucho storage=syain_dansei_02.png jname="マーケ部長"]
; [chara_new name=bucho storage=syain_dansei_03.png jname="部長"]
[chara_new name=sbucho storage=syain_dansei_03.png jname="製造部長"]
[chara_new name=syacho storage=tencho_dansei_01.png jname="社長"]

;------------------------------------------------------------------------------------------------------------------------------
; 本文
[back storage=office01.jpg]
; BGMの指定
[playbgm storage=ReXrelax.ogg volume=40]

ｶﾀｶﾀｶﾀ……[l][r]
オフィス内に無機質なタイピング音が響く。[p]
ここはティローチョコレート株式会社。[l][r]
そして私は、ティロー社のSNS運営担当。[p]
今日も今日とて、新商品に関する情報やお客様からの声に対する返信を投稿している。[p]

ふぅ、新商品に関する告知はこんなところかな。[l][r]
……ん？ホットワードにティロー株式会社が載ってる。[p]
いや～、新商品が予想以上の反応をもらっていてうれしいよ私は……[p]
『ティローチョコの中に虫いたんだけど。何これ？』[p]
……えっ？[l][r]
む、虫！？虫が混入してたってこと！？[l][r]
しかもそこそこ拡散されてる……！[l][r]
こんな時どうすれば……[p]

*root_01
; 選択肢を表示させるときは、ゲームの進行をいったん止める
; [s] も記述してください。でないと選択肢が押せなくなります。
; 選択肢1
[glink y=200 width=800 height=55 size=50 text="上司に相談する。" target=part1_label1 color="white" name="glink_center"]
; 選択肢2
[glink y=580 width=800 height=55 size=50 text="無視して、鎮火するのを待とう。" target=part1_label2 color="white" name="glink_center"]

; 選択肢を中央揃えするjQuaryを実行
; g_link_centerの部分は選択肢内の name="" と一致させる必要があります。
[iscript]
$(".glink_center").css("left","50%");
$(".glink_center").css("transform","translateX(-50%)");
[endscript]
[call target="*Sub_CountDownFive"]
[getrandname name="part1_label{R}" min="1" max="2"]
[cm]
[jump target="& tf.randname"]

;-------------------------------------------------------------------------------------------------------------------------------
; 分岐1-01
;
*part1_label1
[free layer="1" name="timer"]
ええい、こういう時は即断即決！[p]
「現在SNS上でお騒がせしている件についてですが、現在調査中であり、対応をお待たせしています。誠に申し訳ございません。」[l][r]
……っと。[l][r]
とにかく早く上の判断を仰がなきゃ……！[p]

あの！部長、大変です！[l][r]
SNSで虫が混入していたっていう投稿があって、結構な反響を呼んでます！[p]

[chara_show name=mbucho height=1600 right=5 top=320]
#mbucho
虫が！？わかった、今すぐ会議を開いて、対応について考える！[l][r]
キミも同席してもらえるか？[p]
#
わかりました！会議までに報告書作っておきます！[p]
[chara_hide name=mbucho]
[back storage=office02.jpg]
2時間後……[p]
会議には、社長、取締役、マーケティング部長、製造部長、そして私 SNS運営担当が集まった。[p]

[chara_show name=tor height=1600 left=5 top=320]
#tor
さて、我が社の商品に虫が混入していたという話ですが。[l][r]
製造部長、製造ラインの管理は徹底していたのですか？[p]
[chara_hide name=tor]

[chara_show name=sbucho height=1600 right=5 top=320]
#sbucho
当たり前ですよ。滅菌処理も行っていますし、指導も徹底しています。[l][r]
それに、アップされていた写真……あれ、去年の12月に製造されたものですよ。[l][r]
期間限定商品ですから。半年も前の商品を持ち出されても……。[p]
#
[chara_hide name=sbucho]

[chara_show name=mbucho height=1600 left=5 top=320]
#mbucho
少しよろしいですか。[l][r]
製造後、菓子に虫が混入するケースは珍しくありませんよ。[l][r]
6か月も放置された商品であればなおさらです。[p]
今回の騒動を聞いた後、知り合いの昆虫学研究者に連絡を取って、写真を見てもらいました。[p]
この虫はだいたい生後30～40日だそうで、混入したのは出荷後と見て間違いないでしょう。[p]
それと、あの虫は万が一食べても体に害はない、とのことでした。[p]
#
[chara_hide name=mbucho]

[chara_show name=tor height=1600 left=5 top=320]
#tor
ふむ……では、我が社に非があるわけではない、と？[p]
#
[chara_hide name=tor]

[chara_show name=sbucho height=1600 right=5 top=320]
#sbucho
そうですね。[l][r]
何なら、故意的に我が社の評判を落とされたに等しいですよ。[l][r]
普通、半年も経った商品を食べようとしますか？[p]
#
[chara_hide name=sbucho]

#tor
[chara_show name=tor height=1600 left=5 top=320]
うーむ……。[p]
#
あの～……ちょっとよろしいですか？[p]
#tor
何かね。[p]
#
我が社に責任が無い可能性が高いことは分かりますよ。[l][r]
でも、露骨に向こうが悪いと決めつけるのもどうかと……[p]
[chara_hide name=tor]
[chara_show name=mbucho height=1600 left=5 top=320]
#mbucho
何だと？[l][r]
なにか、我々はブランドに泥を塗られ、それでも下手に出ろとでも言いたいのかね？[p]
#
い、いえいえ！決してそういうワケでは！[p]
……でも、SNSが発達したこの世の中、企業イメージは大事です。[p]
今、SNSでは我が社は……いわゆる、悪者の立場にあります。[l][r]
だからこそ、よりクリーンなイメージを出した方がいいんじゃないかと……[p]
#mbucho
ほう、クリーンなイメージ。[l][r]
では、何か方法があるのかね？[p]
#
……製造ラインの点検、清掃を行うべきだと思います。[p]
[chara_hide name=mbucho]
[chara_show name=sbucho height=1600 right=5 top=320]
#sbucho
待て待て！！[l][r]
そんなことをしたら、ティローチョコの製造がストップしてしまうではないか！[p]
大損失になるんだぞ、分かっているのか！！[p]
#
重々承知しています！でも、SNSってみんな好き放題言うんですよ！[p]
それに、少なくとも炎上から2時間は経過しています！[l][r]
やりすぎくらいの対応をするべきだと思います！[p]
#sbucho
損失はどう埋め合わせするんだ！好き勝手言うんじゃない！[p]
#
[chara_hide name=sbucho]
*root_02
; 選択肢1
[glink x=50 y=400 width=800 height=55 size=50 text="無理やりにでも説得する。" target=part2_label1 color="white" name="glink_center]
; 選択肢2
[glink x=50 y=780 width=800 height=55 size=50 text="損失を考えて、ここは黙る。" target=part2_label2 color="white" name="glink_center]
[iscript]
$(".glink_center").css("left","50%");
$(".glink_center").css("transform","translateX(-50%)");
[endscript]
[call target="*Sub_CountDownFive"]
[getrandname name="part2_label{R}" min="1" max="2"]
[cm]
[jump target="& tf.randname"]
;-------------------------------------------------------------------------------------------------------------------------------
; 分岐2-01
;
*part2_label1
[free layer="1" name="timer"]
#
本当にお願いします！社長！この通り！！[p]
[chara_show name=syacho height=1600 left=5 top=320]
#syacho
これこれ、土下座なんぞするもんじゃない！[l][r]
……君の熱意に負けたよ。頭をあげてくれたまえ。[p]
製造部長、申し訳ないが清掃を……[l][r]
少なくとも点検を行ってもらえるだろうか。[p]
胸を張って「製造段階では混入していません」と言おうじゃないか[p]
#
[chara_hide name=syacho]

[chara_show name=sbucho height=1600 right=5 top=320]
#sbucho
社長……よろしいのですか。[p]
#
[chara_hide name=sbucho]

[chara_show name=syacho height=1600 left=5 top=320]
#syacho
仕方ないだろう。これほどの熱意を見せられてはね。[l][r]
それに、SNSに関する動向なら我々よりも彼女の方が数倍詳しい。[p]
#
[chara_hide name=syacho]
[chara_show name=sbucho height=1600 right=5 top=320]
#sbucho
そうですか。確かに、一里あるかも知れません。[l][r]
……君、強く言ってすまなかった。大変申し訳ない。[p]
#
[chara_hide name=sbucho]
そんな、頭をあげてください！[l][r]
それに、会社の損失を守りたい気持ちもよく分ります。[p]
[chara_show name=tor height=1600 right=5 top=320]
#tor
では、製造部長は製造ラインの清掃を。[p]
SNS運営担当は、その旨と、混入は製造ラインの後に起こったこと、[l][r]
虫が生後間もないこと、[p]
万が一食べても問題ないことなどをSNSで発信してください。[l][r]
今回の会議は以上でよろしいですか？[p]
#
[chara_hide name=tor]

[chara_show name=syacho height=1600 left=5 top=320]
#syacho
うむ、問題ないでしょう。[l][r]
皆すまないね、忙しい中……[p]
#
[chara_hide name=syacho]
[back storage=office01.jpg]
結局、社長の鶴の一声で製造ラインの徹底的な清掃が行われ、[l][r]
改めて虫が混入するような隙がないことの裏付けになった。[p]
そのことも含め、私はSNSに釈明、事情説明を投稿した。[p]
「丁寧な対応で感心した」[l][r]
「虫がわくのって結構あることなんだ」[p]
「ていうか、半年も経った商品を食べようとすんなよ」[l][r]
「清掃までやって、企業として完璧な対応」[p]
SNSを見る限り、賞賛の声の方が多かったように思う。[l][r]
それに、今回の対応が功を奏したのか、売上は以前よりも増えた。[p]
目論見通り、企業ブランドは守られたように思う。[p]

[chara_show name=sbucho height=1600 right=5 top=320]
#sbucho
この前は本当にすまなかったね。[p]
結局、やりすぎくらいの対応をしたおかげで製造ストップの損失よりも大きな売り上げに繋がっている。[p]
本当にありがとう。[p]
#
私も、お役に立ててうれしいです。
#sbucho
それで、風のうわさで聞いたんだが、[l][r]
例の写真を投稿した人がバッシングにあっているっていうのは本当なのかね？[p]
#
……はい、[l][r]
悲しいことですが、個人情報特定の流れにもなっているそうです。[p]
そんなことを望んではいないのですが……[p]

#sbucho
……本当に無法地帯なんだな、ネットというのは。[l][r]
かじ取りを少し間違えば、我々がその立場にいたかもしれないと思うとゾッとするよ。[p]
#
[chara_hide name=sbucho]
[chara_show name=mbucho height=1600 left=5 top=320]
#mbucho
お取込み中のところ、少しいいですか？[l][r]
今回の件を踏まえて、SNSに関するガイドラインを作成しようという流れになっていて。[p]
SNS運営担当としての意見も聞きたいので、[l][r]
また時間のある時によろしくお願いします。[p]
#
[chara_hide name=mbucho]
[chara_show name=sbucho height=1600 right=5 top=320]
#sbucho
おぉ……大忙しだな。[l][r]
いやはや、今回は本当にありがとう。[l][r]
これからは私も柔軟な考えをもとうと思う。[p]
#
はい、こちらこそ今後ともよろしくお願いします！[p]
[chara_hide name=sbucho]
こうして、一枚の写真から始まった炎上騒動は、きわめて穏便に幕を閉じたのであった。[p]
Ep1-1 END[p]
[stopbgm]
[call storage=first.ks]

[s]
;-------------------------------------------------------------------------------------------------------------------------------
; 分岐2-02
;
*part2_label2
[free layer="1" name="timer"]
#
(……)[l][r]
(ここまで言われてはどうしようもない。）[p]
身勝手なことを言ってしまい申し訳ありません。[p]

[chara_show name=sbucho height=1600 right=5 top=320]
#sbucho
何度も言いますが、[l][r]
ウチの製造ラインには虫が入り込むような隙はありませんよ。[p]
状況証拠からも出荷後に混入したとみて間違いない。[l][r]
これ以上議論することはないように思えますがね。[p]
#
[chara_hide name=sbucho]
[chara_show name=tor height=1600 left=5 top=320]
#tor
そうですね。[l][r]
では、SNS運営担当は、混入は製造ラインの後に起こったこと、[l][r]
虫が生後間もないこと、[p]
万が一食べても問題ないことなどをSNSで発信してください。[l][r]
今回の会議は以上でよろしいですか？[p]
#
[chara_hide name=tor]
[chara_show name=syacho height=1600 left=5 top=320]
#syacho
うむ、問題ないでしょう。[l][r]
皆すまないね、忙しい中……[p]
#
[chara_hide name=syacho]

[back storage=office01.jpg]
その後、私は言われた内容をSNSで発信した。[p]
「虫がわくのって結構あることなんだな」[l][r]
「普通半年たったチョコを食べようとするか？」[p]
など、新事実に驚く声、[l][r]
写真投稿主を疑う声など様々あったが、[l][r]
その中で[p]
「でも、製造ラインで混入する可能性は0じゃないよな」[l][r]
という意見がふと目に留まった。[p]
我々企業からすれば、出荷前に虫が混入する余地は限りなく0%に近いことは分かっている。[p]
しかし、消費者にとってはその限りではない。[p]
今回はたった1つの意見に過ぎなかったが、[l][r]
こういう懐疑的な投稿がまた新たな波紋を呼ぶことがある。[p]

[chara_show name=mbucho height=1600 left=5 top=320]
#mbucho
少しいいですか？[l][r]
今回の件を踏まえて、SNSに関するガイドラインを作成しようという流れになっていて。[p]
SNS運営担当としての意見も聞きたいので、[l][r]
また時間のある時によろしくお願いします。[p]
#
はい、わかりました！[p]
[chara_hide name=mbucho]
こうして、一枚の写真から始まった炎上騒動は幕を閉じたのであった。[p]
EP1-2 END[p]
[stopbgm]
[call storage=first.ks]

[s]
;-------------------------------------------------------------------------------------------------------------------------------
; 分岐1-02
;
*part1_label2
[free layer="1" name="timer"]
#
下手に動いて事態を悪化させても仕方ない。[l][r]
こういう時は無視して、時間が解決するのを待つのが一番。[p]
[back storage=office02.jpg]
2日後……[p]
上司から連絡があって、今回の件に関する会議に参加することになった。[p]
会議には、社長、取締役、マーケティング部長、製造部長、
そして私SNS運営担当が集まった[p]
[chara_show name=tor height=1600 left=5 top=320]
#tor
さて、今回の炎上騒動についてですが、[l][r]
SNS運営担当は今回の件を知らなかったのですか？[p]
#
いえ、知っていましたが、ボヤ騒ぎだと思いまして……[l][r]
放置しておけば解決するだろうと……。[p]
[chara_hide name=tor]
[chara_show name=mbucho height=1600 left=5 top=320]
#mbucho
そんなわけないでしょう！[l][r]
顧客との信頼関係が重要なこのご時世にそんなことをすればどうなるのか、想像くらいできたはずでは？[p]
#
……勝手なことをしてしまい大変申し訳ありません！[p]
[chara_hide name=mbucho]
[chara_show name=tor height=1600 left=5 top=320]
#tor
製造部長、製造ラインの管理は徹底していたのですか？[p]
[chara_hide name=tor]

[chara_show name=sbucho height=1600 right=5 top=320]
#sbucho
当たり前ですよ。[l][r]
滅菌処理も行っていますし、指導も徹底しています。[l][r]
それに、アップされていた写真……[p]
あれ、去年の12月に製造されたものですよ。[l][r]
期間限定商品ですから。半年も前の商品を持ち出されても……。[p]
[chara_hide name=sbucho]
#

[chara_show name=mbucho height=1600 left=5 top=320]
#mbucho
少しよろしいですか。[l][r]
製造後、菓子に虫が混入するケースは珍しくありませんよ。[p]
6か月も放置された商品であればなおさらです。[p]
今回の騒動を聞いた後、知り合いの昆虫学研究者に連絡を取って、写真を見てもらいました。[p]
この虫はだいたい生後30～40日だそうで、[l][r]混入したのは出荷後と見て間違いないでしょう。[p]
それと、あの虫は万が一食べても体に害はない、とのことでした。[p]
[chara_hide name=mbucho]

[chara_show name=tor height=1600 left=5 top=320]
#tor
ふむ……では、我が社に非があるわけではない、と？[p]
#
[chara_hide name=tor]

[chara_show name=sbucho height=1600 right=5 top=320]
#sbucho
そうですね。[l][r]
何なら、故意的に我が社の評判を落とされたに等しいですよ。[p]
普通、半年も経った商品を食べようとしますか？[p]
#
[chara_hide name=sbucho]
[chara_show name=tor height=1600 left=5 top=320]
#tor
では、その旨をSNS運営担当は速やかに投稿してください。[l][r]
マーケティング部長はホームページに今回の件に関する説明を。[p]
それと、SNS運営担当は今回のような件が起こった際はすぐに連絡を入れるようにしてください。[p]
対応が遅くなればなるほど会社としては不利になります。[l][r]
くれぐれもよろしくお願いしますよ。[p]
#
[chara_hide name=tor]
[back storage=office01.jpg]
その後、私は言われた内容をSNSで発信した。[p]
「虫がわくのって結構あることなんだな」[l][r]「普通半年たったチョコを食べようとするか？」[p]
など、新事実に驚く声、写真投稿主を疑う声など様々あったが、その中で[p]
「対応遅すぎ」[l][r]
「2日経ってから言われてもなぁ」[l][r]
「悪いイメージの方がデカいわ」[p]
といった、マイナスイメージの投稿の方が多かった。[p]
自分が放置している間に炎上はどんどん加速し、[l][r]
世論には悪いイメージを植え付けてしまったようだった。[p]
炎上には対応の速さがキモとなること。[l][r]
よかれと思って勝手に対応すると最悪の結果を招くこと。[l][r]
渡された辞令書とともに、虚しく噛み締めるのであった。[p]
EP2 END[p]
[stopbgm]

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