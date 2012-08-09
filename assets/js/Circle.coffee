class window.Circle
  constructor: (@x, @y, @radius) ->
  
  draw: (ctx) ->
    ctx.arc @x, @y, @radius, 0, Math.PI*2, true
    ctx.closePath()
    ctx.stroke()
    
  setRadius: (@radius) ->
  getRadius: ->
    @radius
