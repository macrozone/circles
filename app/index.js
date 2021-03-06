// Generated by CoffeeScript 1.3.3
var app, assets, express, http, io, port, routes, server, sockets, stylus;

express = require('express');

http = require('http');

stylus = require('stylus');

assets = require('connect-assets');

routes = require('./routes');

sockets = require('socket.io');

app = express();

server = http.createServer(app);

routes(app);

app.use(assets());

app.set('view engine', 'jade');

port = process.env.PORT || process.env.VMC_APP_PORT || 8081;

server.listen(port, function() {
  return console.log("Listening on " + port + "\nPress CTRL-C to stop server.");
});

io = sockets.listen(server);

io.sockets.on('connection', function(socket) {
  console.log('user connected');
  socket.emit('hello', {
    x: 3,
    y: 4
  });
  socket.broadcast.emit('user connected', socket.id);
  return socket.on('move', function(radius) {
    return socket.broadcast.emit('user moved', {
      id: socket.id,
      radius: radius
    });
  });
});
