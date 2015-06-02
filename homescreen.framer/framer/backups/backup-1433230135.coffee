# This imports all the layers for "homescreen" into homescreenLayers
sketch = Framer.Importer.load "imported/homescreen"

sketch.scale = 0

screen = "screen_city1"

# SET DEFAULTS
Framer.Defaults.Animation = {
    curve: "spring(100,20,0)"
}
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
animScaleLogoReverse = animScaleLogo.reverse()

test = (layerName) ->
	layerName.animate
		x: 600
		
# CITIES
# ======

sketch.city1.states.add
	hide: { y: -Screen.height }

sketch.city2.y = 900
sketch.city2.states.add
	show: { x: 0, y: 0, scale: 1 }

# FOOTERS
# =======
sketch.footer1.states.add
	hide: { visible: false }
	
sketch.footer2.states.add
	show: { visible: true }


# Start the animation for initial BG
panZoom(sketch.city1)



# FOOTER
# ======
# Create the tap target
btn_footer = new Layer
	x: 0, y: 1606, width: Screen.width, height: 170, backgroundColor: "transparent"

# Make it draggable
btn_footer.draggable.enabled = true
btn_footer.draggable.horizontal = false

# DragStart listener
btn_footer.on Events.DragStart, (event, layer)->
	sketch.search_form.states.switch("hidden")
	animScaleLogo.start()
	animScaleLogo.on(Events.AnimationEnd, animScaleLogoReverse.start)
	sketch.footer1.states.next()
	sketch.footer2.states.next()
	test(sketch.footer1)
		
# DragMove listener
btn_footer.on Events.DragMove, (event)->
	sketch.city1.y = -Screen.height/event.y

# DragEnd listener	
btn_footer.on Events.DragEnd, ->
	sketch.city1.states.next()
	sketch.city2.states.next()

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