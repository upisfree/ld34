# utils
rand = (min, max) ->
  Math.floor(Math.random() * (max - min) + min)

byId = (a) ->
  document.getElementById a

byClass = (a) ->
  document.getElementsByClassName a

byTag = (a) ->
  document.getElementsByTagName a

# functions and vars
story = null
video = byTag('video')[0]
text = byId('text')

canvas = byId 'icon'
ctx = canvas.getContext '2d'

_act1 = ''
_act2 = ''

end = false

initStage = (key, stage, first) ->
  _act1 = stage.a1
  _act2 = stage.a2

  if stage.t
    text.innerText = stage.t
  else
    text.innerText = ''

  video.loop = false
  video.src = "./assets/#{key}.mp4"

  if stage.end
    end = true

  if not first
    text.style.display = 'none'
    byId('act1').style.display = 'none'
    byId('act2').style.display = 'none'

# start
# load json with story
xhr = new XMLHttpRequest()
xhr.open 'GET', 'story.json', true
xhr.send();

xhr.onreadystatechange = ->
  if xhr.readyState != 4
    return

  if xhr.status != 200
    alert 'Hm...\nError! Press F5.\n\nError code: ' + xhr.status
  else
    story = JSON.parse xhr.responseText

    initStage 'start', story['start'], true

    video.onended = (e) ->
      if end
        location.reload()
      
      video.loop = true
      video.src = './assets/start.mp4'

      text.style.display = 'block'
      byId('act1').style.display = 'block'
      byId('act2').style.display = 'block'

    byId('act1').onclick = ->
      initStage _act1, story[_act1]

    byId('act2').onclick = ->
      initStage _act2, story[_act2]

# icon
setInterval ->
  ctx.fillStyle = '#000'
  ctx.fillRect 0, 0, 16, 16
  ctx.fillStyle = '#ffffff'
  ctx.font = 'bold 14px Lora'
  ctx.fillText rand(0, 9), 4, 13

  byTag('link')[0].href = canvas.toDataURL 'image/x-icon'
, 75