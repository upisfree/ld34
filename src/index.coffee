# utils
byId = (a) ->
  document.getElementById a

byClass = (a) ->
  document.getElementsByClassName a

byTag = (a) ->
  document.getElementsByTagName a

setText = (t, _id) -> # cause it's reserwed word
  byId(_id).innerText = t

# start
setText 'допустим, это достаточно длинный и загадочный русский текст', 'text'
setText 'мартынов', 'act1'
setText 'лох', 'act2'