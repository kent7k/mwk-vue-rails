<template>
  <section>
    <template v-if="!isLogin">
      <v-btn
        text
        class="ml-4 mr-2 font-weight-bold"
        color="white"
        @click.stop="loginDialog(true)"
      >
        ログイン
      </v-btn>
      <v-dialog v-model="loginModal" max-width="600px" persistent>
        <the-modal-login />
      </v-dialog>
      <v-btn
        class="ml-4 mr-2 white--text font-weight-bold"
        color="#E2C6C7"
        @click.stop="signUpDialog(true)"
      >
        新規登録
      </v-btn>
      <v-btn
        class="ml-4 mr-2 yellow--text font-weight-bold"
        color="orange"
        @click="guestLogin"
      >
        ゲストログイン
      </v-btn>
      <v-dialog v-model="signUpModal" max-width="600px" persistent>
        <the-modal-sign-up />
      </v-dialog>
    </template>
    <template v-else>
      <section>
        <v-btn depressed rounded icon @click="logout">
          <v-icon color="#E5F2E8">mdi-logout</v-icon>
        </v-btn>

        <dialog-component :is-account-page="true" class="" />
      </section>
    </template>
  </section>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'

export default {
  data() {
    return {
      guest: {
        email: 'tester9520@gmail.com',
        password: 'KRVU3KcLVW7VDZD7iQZUVeDB9',
      },
    }
  },
  computed: {
    ...mapGetters({
      /* TheHeader */
      isLogin: 'auth/isLoggedIn',
      loginModal: 'modal/loginModal',
      signUpModal: 'modal/signUpModal',
      /* TheHeader */

      posts: 'post/posts',
      // user: 'user/user',
      // loginUser: 'auth/loginUser',
    }),
  },

  methods: {
    /* TheHeader */
    ...mapActions({
      logout: 'auth/logout',
      login: 'auth/login',
      loginDialog: 'modal/loginUser',
      signUpDialog: 'modal/signUpUser',
    }),
    guestLogin() {
      this.login(this.guest)
    },
  },
}
</script>
