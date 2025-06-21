export default function ({ $axios, redirect }) {
  $axios.onRequest((config) => {
    // SSR 中は window が無いのでガード
    if (process.client) {
      const token   = localStorage.getItem('access-token')
      const client  = localStorage.getItem('client')
      const uid     = localStorage.getItem('uid')
      const expiry  = localStorage.getItem('expiry')
      const type    = localStorage.getItem('token-type')

      // null を送らない。存在するものだけ載せる
      if (token && client && uid) {
        Object.assign(config.headers, {
          'access-token': token,
          client,
          uid,
          expiry,
          'token-type': type,
        })
      }
    }
    config.headers['Content-Type'] = 'application/json'
    return config
  })

  $axios.onResponse((response) => {
    if (process.client && response.headers.client) {
      localStorage.setItem('access-token', response.headers['access-token'])
      localStorage.setItem('client',       response.headers.client)
      localStorage.setItem('uid',          response.headers.uid)
      localStorage.setItem('token-type',   response.headers['token-type'])
      localStorage.setItem('expiry',       response.headers.expiry)
    }
    return response
  })

  // ---------- エラー ----------
  $axios.onError((error) => {
    if (error.response?.status === 401) {
      // トークン失効時の再ログイン誘導など
      redirect('/login')
    }
    return Promise.reject(error)
  })
}
