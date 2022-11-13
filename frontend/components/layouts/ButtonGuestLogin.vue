<template>
  <v-card>
    <v-system-bar lights-out>
      <v-spacer></v-spacer>
      <v-btn icon class="mt-6" large @click="guestLogin">
        <v-icon>mdi-close</v-icon>
      </v-btn>
    </v-system-bar>
  </v-card>
</template>

<script>
import { mapActions } from 'vuex'
export default {
  data() {
    return {
      isValid: false,
      show: false,
      noValidation: true,
      user: {
        email: '',
        password: '',
      },
      guest: {
        email: 'tester9520@gmail.com',
        password: 'KRVU3KcLVW7VDZD7iQZUVeDB9',
      },
      emailRules: [(v) => !!v || '', (v) => /.+@.+\..+/.test(v) || ''],
    }
  },
  computed: {
    toggle() {
      const icon = this.show ? 'mdi-eye' : 'mdi-eye-off'
      const type = this.show ? 'text' : 'password'
      return { icon, type }
    },
  },
  methods: {
    ...mapActions({
      login: 'auth/login',
      loginDialog: 'modal/loginUser',
      signUpDialog: 'modal/signUpUser',
    }),
    loginUser() {
      this.login(this.user)
      this.loginDialog(false)
    },
    guestLogin() {
      this.login(this.guest)
      this.loginDialog(false)
    },
    signUpLink() {
      this.loginDialog(false)
      this.signUpDialog(true)
    },
  },
}
</script>

