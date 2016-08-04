KEY = process.env.GOOGLE_IMAGE_SEARCH_KEY
SEARCH_ID = ''
SEARCH_URL = 'https://www.googleapis.com/customsearch/v1?key='+KEY+'&cx='+SEARCH_ID+'&searchType=image&q=saigenos'


module.exports = (genos) ->
   genos.enter (res) ->
     if res.message.user.name == 'cikyra'
       
     # at this point you can get the user's name with:
     # response.message.user.name
     # works the same for robot.leave
