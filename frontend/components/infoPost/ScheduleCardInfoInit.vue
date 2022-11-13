<template>
  <!-- <v-sheet class="rounded-card" elevation="5"> -->
  <v-sheet>
    <v-card-text class="text-center align-self-center">
      <div class="orangecolor">
        <div
          class="display-2 shadow-text1 pink--text font-weight-bold no-wrap-text"
        >
          ヘルプ
        </div>
      </div>
    </v-card-text>
    <v-card class="ml-2 mr-2" tile rounded-card>
      <v-card-text>
        <b>「子どもたちのネットワークに異年齢間の交友関係を作り出したい」</b
        ><br />
        そのような思いで制作しました。<br /><br />

        実際に、異年齢保育/教育（０〜１２歳）の現場で親御さんに直接リサーチしたり、SNSでママパパのコミュニティの情報も毎日集めたりしたところ、<br />
        <b
          >子どもたちのコミュニティで異年齢間の交友が減っているという問題を認識</b
        >しました。 <br /><br />
        その解決のためには、ママパパのコミュニティを広げることが必要であるという経験則から、マッチングアプリを開発。<br /><br />
        <b>気軽に “Let’s meet with kids!” できるようなサービス</b
        >を目指しました。
      </v-card-text>
    </v-card>
    <v-card-text class="text-center align-self-center">
      <div class="orangecolor">
        <div
          class="display-1 shadow-text1 pink--text font-weight-bold no-wrap-text mt-10"
        >
          最初の手順
        </div>
      </div>
      <div class="orangecolor">
        <div
          class="shadow-text2 pink--text font-weight-bold no-wrap-text"
        ></div>
      </div>

      <v-img contain :src="require('@/assets/images/help/help1.gif')"></v-img>
      ページ右上の「ゲストログイン」を<br />
      クリックしてください。
    </v-card-text>
    <v-card-text class="text-center align-self-center">
      <div class="orangecolor">
        <div
          class="display-1 shadow-text1 pink--text font-weight-bold no-wrap-text mt-10"
        >
          参加までの４クリック
        </div>
      </div>
      <div class="orangecolor">
        <div class="shadow-text2 pink--text font-weight-bold no-wrap-text">
          ページ遷移がないスムーズな参加手続
        </div>
      </div>
    </v-card-text>
    <v-card-text class="text-center align-self-center">
      <!--       <v-img
        contain
        :src="require('@/assets/images/intro/intro_heart.png')"
        class="mr-5 ml-5"
      ></v-img>
 -->
      <div class="orangecolor">
        <div class="pink--text font-weight-bold no-wrap-text">
          ①１クリック目（<v-icon color="pink">mdi-heart-outline</v-icon>ボタン）
        </div>
      </div>

      <v-img
        contain
        :src="require('@/assets/images/intro/hl1.png')"
        class="mr-5 ml-5"
      ></v-img>
      <div class="caption">[ 図 ]<br /><br /><br /></div>
      <v-img
        contain
        :src="require('@/assets/images/intro/hl1.gif')"
        class="mr-5 ml-5"
      ></v-img>

      <div class="caption">[ gif解説 ]<br /><br /></div>

      <div class="mb-5">
        気になる募集があったら、<v-icon color="pink">mdi-heart-outline</v-icon
        >を押していきましょう。<br />
        たくさん押しても大丈夫。あとで見返すことができます。<br /><br /><br />
      </div>
      <!--       <v-img
        contain
        :src="require('@/assets/images/intro/intro_search.png')"
      ></v-img>
 -->

      <div class="orangecolor">
        <div class="pink--text font-weight-bold no-wrap-text">
          ②２クリック目（<v-icon color="green">mdi-dots-vertical</v-icon
          >ボタン）
        </div>
      </div>

      <v-img contain :src="require('@/assets/images/intro/hl2.png')"></v-img>
      <div class="caption">[ 図 ]<br /><br /><br /></div>

      <v-img contain :src="require('@/assets/images/intro/hl3.gif')"></v-img>
      <div class="caption">[ gif解説 ]<br /><br /></div>

      <div class="mb-10">
        右上の <v-icon>mdi-dots-vertical</v-icon> で見返してみましょう。<br />
        このストックはいつでも見返すことができます。<br /><br /><br />
      </div>

      <div class="orangecolor">
        <div class="pink--text font-weight-bold no-wrap-text">
          ③３クリック目（<v-icon color="orange">mdi-walk</v-icon>ボタン）
        </div>
      </div>
      <!--       <v-img
        contain
        :src="require('@/assets/images/intro/intro_like.png')"
        class="mr-10 ml-10"
      ></v-img>
 -->

      <v-img
        contain
        :src="require('@/assets/images/intro/hl3.png')"
        class="mr-5 ml-5"
      ></v-img>
      <div class="caption">[ 図 ]<br /><br /><br /></div>

      <v-img contain :src="require('@/assets/images/intro/hl5.gif')"></v-img>
      <div class="caption">[ gif解説 ]<br /><br /></div>

      <div class="mb-10">
        次に、<v-icon color="orange">mdi-walk</v-icon
        >を押して詳細を見てみましょう。<br /><br /><br />
      </div>

      <div class="orangecolor">
        <div class="pink--text font-weight-bold no-wrap-text">
          ④４クリック目（<v-icon color="red">mdi-run</v-icon>ボタン）
        </div>
      </div>

      <!--       <v-img
        contain
        class="mr-10 ml-10"
        :src="require('@/assets/images/intro/intro_post_dialog.png')"
      ></v-img>
 -->
      <v-img contain :src="require('@/assets/images/intro/hl4.png')"></v-img>
      <div class="caption">[ 図 ]<br /><br /><br /></div>

      <v-img contain :src="require('@/assets/images/intro/hl6.gif')"></v-img>
      <div class="caption">[ gif解説 ]<br /><br /></div>

      詳細ページです。<v-icon color="red">mdi-run</v-icon>
      を押して参加完了です。<br /><br /><br />

      <br /><br />

      <div class="orangecolor">
        <div
          class="display-1 shadow-text1 pink--text font-weight-bold no-wrap-text mt-10"
        >
          メッセージページ
        </div>
      </div>
      <div class="orangecolor">
        <div
          class="shadow-text2 pink--text font-weight-bold no-wrap-text"
        ></div>
      </div>

      <v-img contain :src="require('@/assets/images/intro/hl5.png')"></v-img>
      <div class="caption">[ 図 ]<br /><br /><br /></div>

      <v-img contain :src="require('@/assets/images/intro/hl8.gif')"></v-img>
      <div class="caption">[ gif解説 ]<br /><br /></div>
      <div class="caption">
        時間がある時には、
        <v-icon color="orange">mdi-email-variant</v-icon>
        を押してメッセージを送りにいきましょう。<br /><br />
      </div>
    </v-card-text>

    <v-card-text class="text-center align-self-center">
      <v-img contain :src="require('@/assets/images/help/help5.gif')"></v-img>
      <div class="caption">[ gif解説（補足）]<br /><br /></div>
      <div class="caption">
        「参加」は、メッセージを送るページからでも可能です<br /><br />
      </div>
    </v-card-text>
    <v-card-text class="text-center align-self-center">
      <div class="orangecolor">
        <div
          class="display-1 shadow-text1 pink--text font-weight-bold no-wrap-text mt-10"
        >
          メンバーリスト
        </div>
      </div>
      <div class="orangecolor">
        <div
          class="shadow-text2 pink--text font-weight-bold no-wrap-text"
        ></div>
      </div>
    </v-card-text>
    <v-img
      contain
      :src="require('@/assets/images/help/help_follow.gif')"
    ></v-img>
    <v-card-text class="text-center align-self-center">
      カード下部の <v-icon>mdi-run</v-icon> をクリック。フォローもできます。
    </v-card-text>
    <v-card-text class="text-center align-self-center">
      <div class="orangecolor">
        <div
          class="display-1 shadow-text1 pink--text font-weight-bold no-wrap-text mt-10"
        >
          ポスト作成
        </div>
      </div>
      <div class="orangecolor">
        <div
          class="shadow-text2 pink--text font-weight-bold no-wrap-text"
        ></div>
      </div>
    </v-card-text>
    <v-img
      contain
      class="mr-7"
      :src="require('@/assets/images/intro/hl7.png')"
    ></v-img>
    <v-card-text class="text-center align-self-center">
      ページ右下の <v-icon color="red">mdi-pencil</v-icon> をクリック。<br />
      どこからでもポストすることができます。
    </v-card-text>
    <v-card-text class="text-center align-self-center">
      <div class="orangecolor">
        <div
          class="display-1 shadow-text1 pink--text font-weight-bold no-wrap-text mt-10"
        >
          ポスト編集/削除
        </div>
      </div>
      <div class="orangecolor">
        <div
          class="shadow-text2 pink--text font-weight-bold no-wrap-text"
        ></div>
      </div>
    </v-card-text>
    <v-img contain :src="require('@/assets/images/intro/hl8.png')"></v-img>
    <v-card-text class="text-center align-self-center">
      <b>メッセージページ</b>右上の<br />
      <v-icon color="orange">mdi-pencil</v-icon>で編集、<v-icon color="green"
        >mdi-delete</v-icon
      >で削除することができます。<br />
    </v-card-text>
  </v-sheet>
</template>

<script>
import { mapGetters } from 'vuex'
// import buttonLike from '~/components/layouts/ButtonLike.vue'
// import userAvatar from '~/components/infoUser/UserAvatar.vue'
// import postMessage from '~/components/infoPost/PostMessage.vue'

export default {
  components: {
    // buttonLike,
    // userAvatar,
    // postMessage,
  },
  props: {
    // post: {
    //   type: Object,
    //   default: () => ({}),
    //   required: true,
    // },
  },
  data() {
    return {
      defaultImage: require(`@/assets/images/default.png`),
      /* reverse: true, */
      dialog: false,
    }
  },
  computed: {
    ...mapGetters({
      posts: 'post/posts',
      loginUser: 'auth/loginUser',
    }),
  },
  created() {
    this.$axios
      .get(`api/v1/posts/${this.$route.params.id}`)
      .then((res) => {
        this.$store.commit('post/setPost', res.data, { root: true })
      })
      .then(() => {
        if (this.login) {
          this.post.join_users.forEach((f) => {
            if (f.id === this.user.id) {
              this.join = true
            }
          })
        }
      })
  },
  methods: {
    closeDialog() {
      this.dialog = false
    },
  },
}
</script>

<style scoped>
.rounded-card {
  border-radius: 20px;
}
.shadow-text1 {
  text-shadow: 1px 1px 2px #ffffff;
}
.shadow-text2 {
  text-shadow: 2px 2px 3px #ffffff;
  border-bottom: double;
}
.orangecolor {
  background: #ffffff; /*背景色*/
  padding: 0.5em; /*文字周りの余白*/
  color: white; /*文字を白に*/
  background-color: rgba(255, 255, 255, 0.9);
  border-radius: 0.5em; /*角の丸み*/
}
</style>
