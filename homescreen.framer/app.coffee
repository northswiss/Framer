# This imports all the layers for "homescreen" into homescreenLayers
sketch = Framer.Importer.load "imported/homescreen"

sketch.scale = 0

screen = "screen_city1"

# SET DEFAULTS
new BackgroundLayer
	backgroundColor: "black"

# ANIMATIONS

panZoom = (layerName) ->
	layerName.animate
		delay: 1
		properties: { x: -100, y: -100, scale: 1.3 }
		time: 30
		curve: "linear"

animFadeOut = new Animation({
	layer: sketch.footer
	properties: { opacity: 0 }})
	
animScaleLogo = new Animation ({
	layer: sketch.logo
	properties: { scale: .2 }
	curve: "cubic-bezier(0.39, 0.575, 0.565, 1)"
	time: .4
})

bgShow = (bg) ->
	bg.animate
		properties: { x: 0, y: 0, scale: 1 }
		
bgHide = (bg) ->
	bg.animate
		properties: { y: -Screen.height}
		
animScaleLogoReverse = animScaleLogo.reverse()

fadeOut = (layerName) ->
	layerName.animate
		time: .5
		properties: { opacity: 0 }

fadeIn = (layerName) ->
	layerName.animate
		time: 1.5
		properties: { opacity: 1 }


# HEADER BUTTON
# ======
	
# btn_header = new Layer
# 	width: Screen.width, height: 500
			
# CITIES
# ======

# Initialise all other cities y position
sketch.city2.y = 900

# Start the animation for initial BG
panZoom(sketch.city1)

# FOOTER
# ======
	
sketch.footer2.opacity = 0

# Create the tap target
btn_footer = new Layer
	x: 0, y: 1606, width: Screen.width, height: 170, backgroundColor: "transparent"

# Make it draggable
btn_footer.draggable.enabled = true
btn_footer.draggable.horizontal = false

func = () ->	
	sketch.search_form.states.switch("hidden")
	animScaleLogo.start()	
	fadeOut(sketch.footer1)
	fadeIn(sketch.footer2)
	animScaleLogo.on(Events.AnimationEnd, animScaleLogoReverse.start)

funcReverse = () ->
	animScaleLogo.start()
	fadeOut(sketch.footer2)
	fadeIn(sketch.footer2)
	animScaleLogo.on(Events.AnimationEnd, animScaleLogoReverse.start)
	
# DragStart listener
btn_footer.on Events.DragStart, (event, layer)->
	func()
 	
# btn_header.on Events.DragStart, ->
# 	funcReverse()
		
# DragMove listener
btn_footer.on Events.DragMove, (event)->
	sketch.city1.y = -Screen.height/event.y

# DragEnd listener	
btn_footer.on Events.DragEnd, ->
# 	sketch.city2.states.next()
	bgShow(sketch.city2)
# 	sketch.city1.states.next()
	bgHide(sketch.city1)

sketch.city2.on Events.AnimationEnd, ->
	panZoom(sketch.city2)

# Only allow the btn_footer to be swiped on lower half
btn_footer.draggable.constraints = { x:0, y: 1606, width: Screen.width, height: 1020 }



# SEARCH FORM
# ===========

# Fade search form
sketch.search_form.states.add
	hidden: { opacity: 0, scale: .9 }
	shown: { opacity: 1, scale: 1 }

# Bring search form back
sketch.logo.on Events.Click, ->
	sketch.search_form.states.switch("shown")

chevrons = new Layer
	x:492, y:1668, width:36, height:59, image:"images/arrows.gif"