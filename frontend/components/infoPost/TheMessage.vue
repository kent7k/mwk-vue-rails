<template>
  <v-sheet class="ml-8 mr-8 mt-4  rounded">
    <v-card class="mx-auto" color="#26c6da" dark max-width="400">
      <v-card-title>
        <v-menu transition="scroll-x-transition">
          <template #activator="{ on, attrs }">
            <v-btn
              color="white"
              class="ma-2"
              v-bind="attrs"
              outlined
              icon
              v-on="on"
            >
              <v-icon>mdi-magnify</v-icon>
            </v-btn>
          </template>
          <v-avatar size="500" class="radius-image">
            <v-img
              v-if="message.image.url"
              :src="message.image.url"
              alt="avatar"
            />
            <v-img v-else :src="defaultImage" contain />
          </v-avatar>
        </v-menu>
        <span class="headline font-weight-bold">{{ message.title }}</span>
      </v-card-title>

      <v-card-text class="title font-weight-light">
        <v-row>
          <v-col cols="9">
            {{ message.content }}
          </v-col>
          <v-col v-if="message.image.url" cols="3">
            <template>
              <v-avatar size="80" class="radius-image mt-3 mb-3">
                <v-img
                  v-if="message.image.url"
                  :src="message.image.url"
                  alt="avatar"
                />
                <v-img v-else :src="defaultImage" contain />
              </v-avatar>
            </template>
          </v-col>
        </v-row>
      </v-card-text>

      <v-card-actions>
        <v-list-item class="grow">
          <v-list-item-avatar color="grey darken-3">
            <v-img
              class="elevation-6"
              alt=""
              src="https://avataaars.io/?avatarStyle=Transparent&topType=ShortHairShortCurly&accessoriesType=Prescription02&hairColor=Black&facialHairType=Blank&clotheType=Hoodie&clotheColor=White&eyeType=Default&eyebrowType=DefaultNatural&mouthType=Default&skinColor=Light"
            ></v-img>
          </v-list-item-avatar>

          <v-list-item-content>
            <v-list-item-title>Evan You</v-list-item-title>
          </v-list-item-content>

          <v-row align="center" justify="end">
            <v-icon class="mr-1">
              mdi-timelapse
            </v-icon>
            <span class="subheading">
              {{ $dayjs(message.created_at).format('MM/DD') }}&nbsp;{{
                $dayjs(message.created_at).format('hh:mm')
              }}</span
            >
          </v-row>
        </v-list-item>
      </v-card-actions>
    </v-card>

    <v-card flat>
    </v-card>
  </v-sheet>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  props: {
    message: {
      type: Object,
      default: () => ({}),
      required: true,
    },
  },
  data() {
    return {
      createDate: '',
      rating: this.message.rate,
      expand: false,
      like: false,
    }
  },
  computed: {
    ...mapGetters({
      loginUser: 'auth/loginUser',
      login: 'auth/isLoggedIn',
    }),
    loginUserMessage() {
      return this.$store.state.post.post
    },
  },
}
</script>

<style scoped>
.radius-image {
  border-radius: 20px;
  border: 1px solid #bdbdbd;
}
</style>
