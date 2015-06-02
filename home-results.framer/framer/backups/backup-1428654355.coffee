# This imports all the layers for "Home-Results" into homeResultsLayers1
mLayers = Framer.Importer.load "imported/Home-Results"

# Welcome to Framer

# Learn how to prototype: http://framerjs.com/learn
# Drop an image on the device, or import a design from Sketch or Photoshop


mLayers.btn_text.html = "SEARCH"
mLayers.btn_text.style = {
        "font-size" : "54px",
	}
	
gotoResults = ->
	mLayers.appbarHome.animate 
		properties: {opacity: 0}
	mLayers.btn_search
		.animate
			properties: { 
				x: 0,
				y:62
				width: 1080
			}
		.html = "hello"
	mLayers.btn_text.animate
		properties : {
			x : 216
		}
			
		
gotoHome = ->
	mLayers.appbarHome
		.animate 
			properties: {
				opacity: 1
			}
		.html = "hello"	
	mLayers.btn_search.animate
		properties: {
		}	
		
	
	
	
	
mLayers.contentFrame

# Set initial view as home
gotoHome()

toggler = Utils.toggle(gotoResults, gotoHome)

mLayers.btn_search.on Events.TouchStart, (e) ->
  e.preventDefault()
  movePage = toggler()
  movePage()