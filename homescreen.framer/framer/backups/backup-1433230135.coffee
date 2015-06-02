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

# ANIMATION

# CITIES
# ======

sketch.city1.states.add
	hide: { y: -Screen.height }

sketch.city2.y = 1100
sketch.city2.states.add
	show: { x: 0, y: 0, scale: 1 }

# FOOTERS
# =======
sketch.footer1.states.add
	hide: { visible: false }
	
sketch.footer2.states.add
	show: { visible: true }

animKenBurrows = new Animation({
	layer: sketch.city1
	properties: { x: -100, y: -100, scale: 1.3 }
	delay: 2
	time: 30
	curve: "linear"
})
animKenBurrows.start()


animFadeOut = new Animation({
	layer: sketch.footer
	properties: { opacity: 0 }
})

# Animation style for image bg transitions
animScaleLogo = new Animation ({
	layer: sketch.logo
	properties: { scale: .2 }
	time: .1
})
animScaleLogoReverse = animScaleLogo.reverse()


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
	animKenBurrows.stop()
	sketch.footer1.states.next()
	sketch.footer2.states.next()
		
# DragMove listener
btn_footer.on Events.DragMove, (event)->
	sketch.city1.y = -Screen.height/event.y

# DragEnd listener	
btn_footer.on Events.DragEnd, ->
	sketch.city1.states.next()
	sketch.city2.states.next()
# 	sketch.city2.animKenBurrows.start()

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
	