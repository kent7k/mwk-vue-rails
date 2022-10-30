<template>
  <div>
    <!-- <v-btn depressed rounded text @click="initData"> initData </v-btn> -->
    <!-- <search-form /> -->
    <!-- <v-btn depressed rounded text @click="logout"> ログアウト </v-btn> -->
    <search />

    <v-footer
      class="elevation-10 footertitle flex justify-center mt-5"
      color="#BADEC3"
      absolute
    >
      <div class="white--text">
        &copy; {{ new Date().getFullYear()
        }}<span class="ml-2">MeetWithKids</span>
      </div>
    </v-footer>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
import Search from '~/components/search/Search.vue'
// import searchForm from '~/components/search/SearchForm.vue'

export default {
  components: {
    Search,
    // searchForm,
  },
  data() {
    return {
      tasks: [],
    }
  },
  computed: {
    /* ========== ScheduleCard =========== */
    ...mapGetters({
      /* user: 'user/user', */
      user: 'auth/loginUser',
    }),
    /*     postUpdate() {
      return this.$store.state.post.post
    }, */
    /* ========== ScheduleCard =========== */
  },

  methods: {
    ...mapActions({
      /* user: 'user/user', */
      /* initData: 'tab/initData', */
      logout: 'auth/logout',
    }),
    async getSomething() {
      // タスク一覧を取得するための API を叩く
      const response = await this.$axios.$get('api/v1/users')
      this.users = JSON.parse(response.users)
    },
  },

  // 環境変数チェック
  // created() {
  //   console.log('It\'s the test!')
  //   console.log(process.env.RAILS_GUEST_ADDRESS)
  // },
}
</script>

<style scoped>
/* To check where parts are arranged */
/* div {
  border: 5px solid yellow;
} */
.footertitle {
  color: white;
  font-size: 18px;
  font-family: 'Gill Sans', sans-serif;
  /* https://developer.mozilla.org/en-US/docs/Web/CSS/font-family */
}
</style>
