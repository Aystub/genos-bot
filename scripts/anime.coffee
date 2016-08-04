module.exports = (genos) ->

  CLIENT_ID = 'aystub-hiwh3'
  CLIENT_SECRET = '2rmambl9wIqbwzlLYOD8wh1L3R9'
  GRANT_TYPE = 'client_credentials'
  BASE_URL = 'https://anilist.co/api'
  date = new Date
  month = date.getMonth() + 1
  dayplusseven = date.getDate() + 7
  if month < 10
    month = "0" + month
  today = date.getFullYear()+'-'+month+'-'+date.getDate()
  weekfromtoday = date.getFullYear()+'-'+month+'-'+dayplusseven

  genos.respond /anime today/i, (bot) ->
    currently = []
    genos.http(BASE_URL+'/auth/access_token?grant_type='+GRANT_TYPE+'&client_id='+CLIENT_ID+'&client_secret='+CLIENT_SECRET)
    .post("") (err, res, body) ->

      auth = JSON.parse body

      genos.http(BASE_URL+'/browse/anime?season=summer&year=2016&type=TV&airing_data=true&full_page=true&access_token='+auth.access_token)
      .get() (err, res, body) ->

        shows = JSON.parse body

        for show in shows
          if show.airing != null
            if today == "#{show.airing.time}"[0..9]
              currently.push show

            if weekfromtoday == "#{show.airing.time}"[0..9]
              currently.push show

        bot.send "Today we have:"
        for show in currently
          bot.send "#{show.title_english}: #{show.image_url_lge}"
