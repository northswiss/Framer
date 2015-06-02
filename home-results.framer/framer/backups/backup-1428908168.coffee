# This imports all the layers for "Home-Results" into homeResultsLayers1
mLayers = Framer.Importer.load "imported/Home-Results"

bg = new BackgroundLayer backgroundColor: "#FFF"
mLayers.btn_text.style = {
        "font-size" : "54px",
	}
	
btn_search_x = mLayers.btn_search.x
btn_search_y = mLayers.btn_search.y
btn_search_width = mLayers.btn_search.width

btn_text_x = mLayers.btn_text.x
btn_text_y = mLayers.btn_text.y
btn_text_width = mLayers.btn_text.width

gotoResults = ->
	mLayers.appbar_home.animate 
		properties: {opacity: 0}
		
	mLayers.searchForm.animate
		properties : {
			opacity : 0
		}
	mLayers.btn_search
		.animate
			properties: { 
				x: 0,
				y:72
				height: 240
				width: 1080
			}
	mLayers.btn_text.animate
		properties : {
			x : 216
			y: 60
			width: 900
		}	
	mLayers.btn_text.html = "Budapest, Hungary"
	
	mLayers.ic_back.visible	
	
gotoHome = ->
	mLayers.appbar_home.animate 
			properties: {
				opacity: 1
			}
	mLayers.btn_search.animate
		properties: {
				x: btn_search_x,
				y:btn_search_y,
				height:108
				width: btn_search_width
		}	
	mLayers.btn_text.html = "SEARCH"
	mLayers.btn_text.animate
		properties: {
			x: btn_text_x
			y: btn_text_y
			width: 800
		}	
	mLayers.searchForm.animate
		properties : {
			opacity : 1
		}	
mLayers.contentFrame

# Set initial view as home
gotoHome()

toggler = Utils.toggle(gotoResults, gotoHome)

mLayers.btn_search.on Events.TouchStart, (e) ->
  e.preventDefault()
  movePage = toggler()
  movePage()