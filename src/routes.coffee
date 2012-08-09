module.exports = (app) ->

  app.get '/', (req, resp) -> 
    data =
      title: "macrozone.ch"
    resp.render 'index', data
  
  app.get '/demo', (req, resp) ->
    data =
      title: "demo"
    resp.render 'demo', data
  
  app.get '/albrik', (req, resp) ->
    
    links = ["a", "zelle", "Bölle", "schelle"]
    evens = (a for a in [1..100] )
    console.log evens

    data = 
      title: "Albrik"
      links: links
      
    
    
    resp.render 'albrik', data
