<template>
  <v-dialog v-model="dialog" max-width="400">
    <template v-if="$store.state.auth.isLoggedIn" #activator="{ on, attrs }">
      <!-- v-if="message.user_id === $store.state.auth.loginUser.id" -->
      <v-btn v-bind="attrs" icon v-on="on">
        <v-icon> mdi-delete </v-icon>
      </v-btn>
    </template>

    <v-card>
      <v-system-bar lights-out>
        <v-spacer></v-spacer>
        <v-btn icon class="mt-5" @click="dialog = false">
          <v-icon>mdi-close</v-icon>
        </v-btn>
      </v-system-bar>
      <v-card-title class="headline justify-center">
        ページを削除しますか？
      </v-card-title>
      <v-card-text class="mt-3 text-center">
        この操作は取り消すことができません。
      </v-card-text>
      <div class="text-center">
        <v-btn
          color="red"
          class="font-weight-bold justify-center mb-2"
          text
          @click="deletePost(post.id)"
        >
          削除
        </v-btn>
      </div>
    </v-card>
  </v-dialog>
</template>

<script>
// import { mapActions } from "vuex"

export default {
  props: {
    post: {
      type: Object,
      default: () => ({}),
      required: true,
    },
  },
  data() {
    return {
      dialog: false,
    }
  },
  methods: {
    // ...mapActions({ deleteMessage: "post/deleteMessage" }),
    deletePost(id) {
      this.$axios
        .delete(`api/v1/posts/${id}`)
        .then((res) => {
          console.log(res.data)
          console.log('Success')
          this.$store.commit(
            'snackbarMessage/setMessage',
            'メッセージを削除しました。',
            { root: true }
          )
          this.$store.commit('snackbarMessage/setType', 'info', { root: true })
          this.$store.commit('snackbarMessage/setStatus', true, { root: true })
          setTimeout(() => {
            this.$store.commit('snackbarMessage/setStatus', false, {
              root: true,
            })
          }, 1000)
        })
        .catch((err) => {
          console.log(err)
        })
    },

    deleteMessage() {
      this.$axios
        .delete(`api/v1/messages/${this.message.id}`)
        .then(() => {
          this.$store.commit(
            'snackbarMessage/setMessage',
            'メッセージを削除しました。',
            { root: true }
          )
          this.$store.commit('snackbarMessage/setType', 'info', { root: true })
          this.$store.commit('snackbarMessage/setStatus', true, { root: true })
          setTimeout(() => {
            this.$store.commit('snackbarMessage/setStatus', false, {
              root: true,
            })
          }, 1000)
          this.$axios
            .get(`api/v1/posts/${this.$store.state.post.post.id}`)
            .then((res) => {
              console.log(res.data)
              this.$store.commit('post/setPost', res.data, { root: true })
              this.dialog = false
            })
        })
        .catch((err) => {
          console.log(err)
        })
    },
  },
}
</script>
