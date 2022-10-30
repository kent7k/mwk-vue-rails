import colors from 'vuetify/es5/util/colors'

require('dotenv').config()
const { RAILS_GUEST_ADDRESS } = process.env
const { RAILS_GUEST_KEY } = process.env
const { BASE_URL } = process.env

export default {
  ssr: false,
  /* mode: 'spa', */
  env: {
    RAILS_GUEST_ADDRESS,
    RAILS_GUEST_KEY,
    BASE_URL,
  },
  head: {
    title: 'MeetWithKids',
    // titleTemplate: '%s - ' + process.env.npm_package_name,
    // title: process.env.npm_package_name || '',
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      {
        hid: 'description',
        name: 'description',
        content: process.env.npm_package_description || '',
      },
    ],
    link: [{ rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }],
  },
  /*
   ** Customize the progress-bar color
   */
  loading: { color: '#fff' },
  /*
   ** Global CSS
   */
  css: [],
  plugins: [
    { src: '~/plugins/axios.js', ssr: false },
    { src: '~/plugins/dayjs', ssr: false },
    { src: '~/plugins/localStorage.js', ssr: false },
  ],
  /*
   ** Nuxt.js dev-modules
   */
  buildModules: ['@nuxtjs/vuetify', '@nuxt/typescript-build'],
  modules: [
    // '@nuxtjs/proxy',
    '@nuxtjs/axios',
    'nuxt-webfontloader',
    'nuxt-i18n',
    'nuxt-client-init-module',
  ],
  // proxy: {
  //   '/api': {
  //     target: 'https://openweathermap.org',
  //     pathRewrite: {
  //       '^/api': '/api'
  //     }
  //   },
  // '/api': {
  //   target: 'http://localhost:5050',
  //   // pathRewrite: {
  //   //   '^/api': '/api'
  //   // }
  // },
  axios: {
    baseURL:
      process.env.NODE_ENV === 'production'
        ? 'https://rinrei720.com'
        : 'http://localhost:5050',
    // baseURL: process.env.NODE_ENV === "production" ? "https://meetwithkids.org" : "http://localhost:5050"
    // baseURL: "https://meetwithkids.org",
    // baseURL: "https://backend.meetwithkids.org",
    // baseURL: process.env.BASE_URL,
  },
  auth: {
    redirect: {
      login: '/users/login',
      logout: '/',
      callback: false,
      home: '/',
    },
    strategies: {
      local: {
        endpoints: {
          login: {
            url: '/api/v1/auth/sign_in',
            method: 'post',
            propertyName: 'token',
          },
          logout: false,
          user: false,
        },
      },
    },
  },
  /*
   ** vuetify module configuration
   ** https://github.com/nuxt-community/vuetify-module
   */
  vuetify: {
    customVariables: ['~/assets/variables.scss'],
    theme: {
      dark: false,
      themes: {
        dark: {
          primary: colors.blue.darken2,
          accent: colors.grey.darken3,
          secondary: colors.amber.darken3,
          info: colors.teal.lighten1,
          warning: colors.amber.base,
          error: colors.deepOrange.accent4,
          success: colors.green.accent3,
        },
      },
    },
  },
  build: {},
  //   router: {
  //   middleware: ['auth']
  // }
}
