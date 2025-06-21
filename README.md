# Meetwithkids
#### リンク：https://meetwithkids.org/（８月１３日配信停止しました）
#### Qiita：ゼロからAWS/Terraform/Nuxt.js/Rubyを学習し始めると、ポートフォリオのリリースまでにどのような過程を踏むことになるのか？（ https://qiita.com/wonderglot/items/cf0d4faa77b925960802 ）


### 開発環境

```shell
# 0. 念のため停止
docker compose -f docker-compose.dev.yml down

# 1. DB データを削除（必要なければスキップ）
docker volume rm mwk-vue-rails_mkw-dev-db-data

# 2. イメージをビルド（Gem 追加・パッケージ更新時もここ）
docker compose -f docker-compose.dev.yml --env-file .env.development build

# 3. まず db コンテナだけ起動（初期化を完了させる）
docker compose -f docker-compose.dev.yml --env-file .env.development up -d db

# 4. MySQL 初期化完了を待つ（ログに "ready for connections" が出れば OK）
#    例: docker logs -f mwk-dev-db

# 5. backend の DB を作成 & マイグレーション & シード
docker compose -f docker-compose.dev.yml --env-file .env.development \
  run --rm backend rails db:create db:migrate db:seed

# 6. 残りのサービスを起動
docker compose -f docker-compose.dev.yml --env-file .env.development up -d backend frontend
```

## 概要
<b>子どもたちのネットワークに異年齢間の交友関係を作り出したい</b>という思いで制作。<br><br>
実際に異年齢保育/教育（０〜１２歳）の現場で親御さんに直接リサーチしました。<br>
また、SNSでママパパのコミュニティの情報も毎日集めたところ、<br>
<b>子どもたちのコミュニティで異年齢間の交友が減っている</b>という問題を認識しました。<br><br>
その解決のためには、ママパパのコミュニティを広げることが必要であるという経験則から、<br>
マッチングアプリを開発。<b>気軽に “Let’s meet with kids!” できるようなサービス</b>を目指しました。
<br>

![TOP](frontend/assets/images/readme/top2.png "TOP")
![TOP](frontend/assets/images/readme/top3.png "TOP")

<br>

## 制作背景
<b>異年齢保育（０〜１２歳）を実践する保育園で、利用理由を親御さんに直接リサーチ</b>したところ、<br>
その<b>目的は「幼い頃から幅広い年齢層と関わり合うこと」</b>でした。<br>
年齢別の学級・学年では得難い機会が求められていました。<br><br>

私自身も幼少期から幅広い年齢層と関わり合うことが多く、その保育システムに好感を持ちました。<br>
実際に現場に携わったところ、幅広い年齢の子どもたちが、緊張したり恥ずかしがったりしながらも、<br>
次第に、年下から慕われたり年上から可愛がられたりして、<b>人間的に急成長していく</b>姿を見るのは喜ばしかったです。

一方で、<b>そのような機会が得られない子どもたちがいるのではないか？</b>と考えが及びます。

同時期、プライベートでも子どもたちを預かる機会が多くあり、<br>
「色んな子に出会えて嬉しがっている」との声を聞かせてもらいました。<br>
その声の裏側にどのようなリアルがあるのか気になり、<br>
<b>親御さんたちの発信をSNSで毎日リサーチ</b>したところ、

- 「スマホで動画ばかり見て、友達と遊ばない。将来大丈夫かしら」
- 「いつもクラスの同じ友達とゲームばかりしている」

<b>子どもたちの中で異年齢間の交友が以前よりも薄まっている問題を認識</b>しました。<br>
悪いことに、この問題はコロナにより深刻化します。<br><br>

- 「ステイホームで外での付き合いがほとんどなくなってしまった」
- 「１年に一度しかない全学年合同の行事が中止になってしまった」

この問題を解決するために、直接子どもたちのネットワークに異年齢間の交友関係をつくることはできないかと思案しました。<br>
しかし小学生でスマホを持つ現代と言えど、ITの力でそれを実現させるのは非常に難しいと感じました。<br><br>

そこで、ママパパのコミュニティにアプローチをかけることが現実的かつ有効な手段になり得ると考えました。<br>
これは、かつて私が学童設立する際に行った経験に基づいており、<br>
実際の話として、<b>親御さんの交友関係が広がれば、自ずと子どもの交友関係も広がります</b>。<br>

とはいえ、多くの親御さんは異年齢間の関係を与える余裕を持てないでいます。<br>
なぜなら、家事・育児・仕事に追われているからです。<br>
しかしながら、ママパパは時間のやり繰りをして生活をうまく回しています。<br>
その中に、隙間時間が確かにあります。<br>
私はその隙間にすべり込んで、<b>親御さんの中に、“Let’s meet with kids!” の気持ちを生み出したい。</b><br>
<b>それも気軽な気持ちとして。だからサービス名もカジュアルな文法で "Meet with kids"。</b><br>

<b>ひいては、子どもたちのネットワークに異年齢間の交友関係を作り出したい。</b><br>
よろしくお願いします。<br>




## AWS構成図
<br>

![AWS](frontend/assets/images/infrastructure3.png "AWS")
<br>


## ER図
<br>

![ER](frontend/assets/images/ER4.png "ER")
<br>


## 使用した技術
| フロントエンド  | バックエンド  | インフラ |
| :--- | :--- | :--- |
| HTML / CSS / JavaScript | Ruby 2.7.1 | Docker |
| Nuxt.js + Vuetify | Rails 6.0.3 | CircleCI |
| Jest / ESLint / Prettier | RSpec / Rubocop | AWS / Terraform |

※ Rails は APIモード。Nuxt は SPAモード。





<br>

## 工夫した点
* <b>UI/UX の点で意識したこと</b><br><br>
・色に「太陽」と「野原」を意識したこと。<br><br>
・柔らかい雰囲気になるように、全体的に丸みを帯びさせたこと。<br><br>
・<b>50人以上のペルソナを用意して、1人ずつ別々の投稿を考えた</b>こと。<br><br>
・<b>参加までの導線を引いて、忙しい親御さんが隙間時間で</b><br>
　<b>気軽に利用できるようにした</b>こと。（開発途中のgif/Twitter参照）
![ER](frontend/assets/images/spa.gif "ER")

<blockquote class="twitter-tweet"><p lang="ja" dir="ltr">Rails × Nuxt.js × AWS 85日目<br><br>✏️✏️ UI ブラッシュアップ <br><br>SPA化による一連のフローが完成。<br><br>♡（いいね）ボタンでリストインさせ、リストから非同期でページビューさせる。<br><br>モダンな Webアプリ😊
<a href="https://twitter.com/hashtag/%E4%BB%8A%E6%97%A5%E3%81%AE%E7%A9%8D%E3%81%BF%E4%B8%8A%E3%81%92?src=hash&amp;ref_src=twsrc%5Etfw">#今日の積み上げ</a> <a href="https://twitter.com/hashtag/%E3%83%97%E3%83%AD%E3%82%B0%E3%83%A9%E3%83%9F%E3%83%B3%E3%82%B0?src=hash&amp;ref_src=twsrc%5Etfw">#プログラミング</a><a href="https://twitter.com/hashtag/%E9%A7%86%E3%81%91%E5%87%BA%E3%81%97%E3%82%A8%E3%83%B3%E3%82%B8%E3%83%8B%E3%82%A2%E3%81%A8%E7%B9%8B%E3%81%8C%E3%82%8A%E3%81%9F%E3%81%84?src=hash&amp;ref_src=twsrc%5Etfw">#駆け出しエンジニアと繋がりたい</a> <a href="https://t.co/MzcMXo54Xg">pic.twitter.com/MzcMXo54Xg</a></p>&mdash; Kent@Nuxt×AWSで転活中 (@kent_0n) <a href="https://twitter.com/kent_0n/status/1392081284067778563?ref_src=twsrc%5Etfw">May 11, 2021</a></blockquote>
<br>
&nbsp;

* <b>全体の構成で意識したこと</b><br><br>
・<b>忙しい親御さんに利用してもらえるように、完全SPA化で高速なWEBサイトを目指した</b>こと。そのために、Rails (APIモード) と Nuxt.js を掛け合わせて対応したこと。<br><br>
・<b>参加するまでのコンバージョン率を上げるために、ページ遷移を無くして、インデックスページ上で作業を完結できるようにした</b>こと。また、参加を検討するためにストックするリストを用意したこと。
&nbsp;


* <b>Devops の点で意識したこと</b><br><br>
・CircleCI で解析ツール（Rubocop/ESLint/Prettier）を通してエラーの早期発見に対応したこと。<br><br>
・CircleCI と Fargate を連動させることで、ユーザの声に迅速に対応できるデプロイを可能にしたこと。<br><br>
・Terraform を用いて AWS を完全にコード化したことで、柔軟なスケールにも対応できるようにしたこと。<br>



<br>

## 【機能一覧】
| 基本機能 |
| :--- |

* ユーザ登録
* ユーザ削除
* ユーザ情報変更<br>
( アバター、ユーザネーム、パスワード、メールアドレス )
* ユーザーマイページ表示<br>
( お気に入り・参加・メッセージ・フォロー・フォロワー )

* ログイン（ゲストログインを含む）
* フォロー
<br><br>

| ■ 投稿に関する機能 |
| :--- |
* CRUD (生成/読取/更新/削除) 
* ❤️ (お気に入り) 
 * 🏃‍♀️ (参加) 
 * 検索 
 * 参加者一覧 
<br><br>

|メッセージに関する機能|
| :--- |
* CRUD (生成/読取/更新/削除) 
* 画像添付
* 画像プレビュー 
<br><br>

| 管理者機能 |
| :--- |
* 全てのユーザーそれぞれに対する「削除」<br>
* 全ての投稿それぞれに対する「削除 / 編集」<br>
* 全てのメッセージそれぞれに対する「削除」<br>
