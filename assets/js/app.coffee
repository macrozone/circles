#= require "Circle"


    
$ ->
  users = {}
  FPS = 30
  centerX = $(window).width()/2
  centerY = $(window).height()/2
  canvas = document.getElementById "screen"
  canvas.width= $(window).width()
  canvas.height= $(window).height()
  ctx = canvas.getContext "2d"
  
  # socket
  socket = io.connect document.location.origin
  socket.on 'hello', (data) ->
    console.log data
  socket.on 'user connected', (userID) ->
    console.log "connected"+userID
  socket.on 'user moved', (user) ->
    if(!users[user.id]) 
      users[user.id] = new Circle centerX, centerY, user.radius
    users[user.id].setRadius user.radius
   
 
  
  

  ctx.fillStyle = "#FFFF00"

  
  circle1 = new Circle centerX, centerY, 100
  circle1.draw ctx
  
  $(canvas).mousemove (e) ->
    circle1.setRadius Math.sqrt((e.pageX - centerX)*(e.pageX - centerX) + (e.pageY - centerY)*(e.pageY - centerY)) 
    socket.emit 'move', circle1.getRadius()
  window.setInterval ->
    clear ctx
    circle1.draw ctx
    user.draw ctx for id,user of users
  , 1000/FPS
  
  
  # functions
  
  clear = (ctx) ->
   
    ctx.save()
    ctx.clearRect 0, 0, canvas.width, canvas.height
    
    ctx.restore()
    w = canvas.width
    canvas.width = 1
    canvas.width = w
  
    
