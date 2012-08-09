express = require 'express'
http = require 'http'
stylus = require 'stylus'
assets = require 'connect-assets'
routes = require './routes'
sockets = require 'socket.io'


app = express()
server = http.createServer app

# add routes
routes app
# Add Connect Assets
app.use assets()
# Set View Engine
app.set 'view engine', 'jade'


# Define Porat
port = process.env.PORT or process.env.VMC_APP_PORT or 8081
# Start Server
server.listen port, -> console.log "Listening on #{port}\nPress CTRL-C to stop server."
io = sockets.listen server

io.sockets.on 'connection', (socket) ->
  console.log 'user connected'
  socket.emit 'hello', {x:3,y:4}
  socket.broadcast.emit 'user connected', socket.id
  
  socket.on 'move', (radius) ->
    socket.broadcast.emit 'user moved', {id: socket.id, radius}
