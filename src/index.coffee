# utils
byId = (a) ->
  document.getElementById a

byClass = (a) ->
  document.getElementsByClassName a

byTag = (a) ->
  document.getElementsByTagName a

text = (t) -> # cause it's reserwed word
  byId("text").innerText = t

# functions
parseStory = (t) ->
  t = JSON.parse t
  console.log t

# start
# load json with story
xhr = new XMLHttpRequest()
xhr.open 'GET', 'story.json', true
xhr.send();

xhr.onreadystatechange = ->
  if xhr.readyState != 4
    return

  if xhr.status != 200
    alert "Hm...\nError! Press F5.\n\nError code: " + xhr.status
  else
    parseStory xhr.responseText