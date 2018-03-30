<template>
  <section class="user-view">
    <div class="content">
      <div class="subsection">
        <span class="user-username" style="padding: 10px 0 10px 10px; margin: 10px 0 10px 0;">{{ user.username }}</span>
        <span class="user-password" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `(${user.password})` }}</span>
        <nuxt-link :to="{ path: `/users/${user.username}/update`, params: { username: user.username }}">Update</nuxt-link>
      </div>
      <section class='search-main'>
    <div class='content'>
      <div class='subsection'>
        <div style='margin: 25px 5px;'>
          <span class='subsection-title' style='vertical-align: middle;'>What are you searching for? Please fill in the ones that apply.</span>
        </div>
        <div style='margin: 10px 0;'>
          <span class='league-info'>League: </span>
          <input type='text' v-model='leagueName'></input>
        </div>
        <div style='margin: 10px 0;'>
          <span class='league-info'>Country: </span>
          <input type='text' v-model='country'></input>
        </div>
        <div>
          <span class='team-info'>Team: </span>
          <input type='text' v-model='tName'></input>
        </div>
        <div style='margin: 10px 0;'>
          <span class='player-info'>Player: </span>
          <input type='text' v-model='pName'></input>
        </div>
        <div style='margin: 10px 0;'>
          <span class='player-info'>Jersey#: </span>
          <input type='text' v-model='jerseyNum'></input>
        </div>
        <div>
          <br>
          <button type='button' class='button--grey' style='margin-left: 15px;' @click='search()'>Search</button>
        </div>
        <div>
          <nuxt-link class='button--grey' style='margin-top:10px' :to="{ path: `/` }">Back to main</nuxt-link>
        </div>
        <div style='margin: 8px 0;'>
          <table id='results'>
            <thead>
              <tr>
                <th v-for='col in columns'>{{col}}</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for='(row, index) in rows'>
                <td v-for='col in columns'>{{row[col]}}</td>
                <td>
                  <nuxt-link :to="{ path: `search/`,
                    query: { leagueName: searched[index].leagueName.trim(), tName: searched[index].tName.trim(), pName: searched[index].pName.trim() }}">
                    View stats
                  </nuxt-link>
                </td>
                <br>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </section>
    </div>
  </section>
</template>

<script>
import axios from '~/plugins/axios'

export default {
  name: 'username',
  asyncData ({ params, error }) {
    return axios.get('/api/users/' + params.username)
      .then((res) => {
        return { user: res.data }
      })
      .catch((e) => {
        error({ statusCode: 404, message: 'User not found' })
      })
  },
  head () {
    return {
      title: `User: ${this.user.username}`
    }
  },

  data () {
    return {
      league_name: '',
      country: '',
      t_name: '',
      pname: '',
      jerseyNum: '',
      colsSelected: [],
      rows: [],
      columns: [],
      queryParams: {},
      searched: []
    }
  },

  // need to modify this to make it work
  methods: {
    search () {
      let self = this

      self.queryParams = {
        league_name: self.league_name,
        country: self.country,
        t_name: self.t_name,
        pname: self.pname,
        jerseyNum: self.jerseyNum
      }

      for (const param of Object.keys(self.queryParams)) {
        if (self.queryParams[param] === '') {
          delete self.queryParams[param]
        } else {
          self.queryParams[param] = "'" + self.queryParams[param] + "'"
        }
      }

      axios.post('/api/queries/selection_projection', {
        headers: {
          'Content-Type': 'application/json'
        },
        data: {
          queryParams: self.queryParams,
          colsSelected: self.colsSelected
        }
      }).then((res) => {
        if (res.data.length === 0) {
          alert('No results found!')
        }
        self.rows = res.data
        self.columns = Object.keys(self.rows[0])
      }).catch((e) => {
        alert(e.response.data)
      })

      axios.post('/api/queries/selection_projection', {
        headers: {
          'Content-Type': 'application/json'
        },
        data: {
          queryParams: self.queryParams,
          colsSelected: ['t_name']
        }
      }).then((res) => {
        self.searched = res.data
      }).catch((e) => {
        // error will be displayed from first POST request
      })
    }
  }
}
</script>

<style lang="stylus" scoped>
.user-view
  padding-top 0

.content
  position absolute
  width 100%

.subsection
  background-color #fff
  border-radius 2px
  margin 25px 0
  transition all .5s cubic-bezier(.55,0,.1,1)
  padding 10px 30px 10px 30px
  position relative
  line-height 20px
  .subsection-title
    margin 25px 10px
    font-size 26px
    font-weight 500
  .user-username
    font-size 24px
    font-weight 500
  .user-password
    font-size 24px
    font-weight 500
    color #707070
  a
    text-decoration underline
    &:hover
      color #515ec4

</style>
