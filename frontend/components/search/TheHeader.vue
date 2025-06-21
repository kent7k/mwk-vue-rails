<template>
  <div>
    <v-app-bar :clipped-left="clipped" app color="#B0DFC1">
      <TheHeaderTitle />
      <v-spacer />
      <v-text-field
        v-model="searchForm"
        class="mt-6 mr-9 white--text"
        dense
        full-width
        clearable
        color="white"
        rounded
        outlined
        flat
        label="タイトル検索"
        prepend-inner-icon="mdi-magnify"
      />
      <TheHelp />

      <TheLoginButton />
    </v-app-bar>
    <template v-if="search === '投稿' && resPosts.length">
      <schedule-card2 :posts="resPosts" />
    </template>
    <template v-else>
      <schedule-card class="mr-4 ml-4" />
    </template>
  </div>
</template>

<script>
/* TheHeader */
import _debounce from 'lodash.debounce'

export default {
  data() {
    return {
      clipped: true,
      loading: false,
      searchForm: '',
      resPosts: [],
      resUsers: [],
    }
  },
  computed: {
    search: {
      get() {
        return this.$store.state.tab.search
      },
      set(val) {
        this.$store.dispatch('tab/getSearch', val)
      },
    },
  },
  watch: {
    searchForm() {
      _debounce(this.resSearch, 500)()
    },
  },
  methods: {
    resSearch() {
      if (this.search === '投稿' && this.searchForm) {
        this.$axios
          .$get('/api/v1/posts/search', {
            params: {
              search: this.searchForm,
            },
          })
          .then((res) => {
            this.resPosts = res
          })
          .catch((error) => {
            console.log(error)
          })
      } else if (this.search === 'ユーザー' && this.searchForm) {
        this.$axios
          .$get('/api/v1/users/search', {
            params: {
              search: this.searchForm,
            },
          })
          .then((res) => {
            this.resUsers = res
          })
          .catch((error) => {
            console.log(error)
          })
      } else {
        this.resPosts = []
        this.resUsers = []
      }
    },
  },
}
</script>
