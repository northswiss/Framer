# This imports all the layers for "Stay__Android" into stay__androidLayers
sketch = Framer.Importer.load "imported/Stay__Android"
	
imgSize = width: 1080, height: 1920
# Set Values
Cities = [sketch.city1, sketch.city2, sketch.city3]

# Container for all city images
scrollLayer = new Layer
	width: imgSize.width
	height: imgSize.height * Cities.length
	backgroundColor: "transparent"
	superLayer = Screen

scrollLayer.draggable.enabled = true
scrollLayer.draggable.speedX = 0
	
scrollLayer.on Events.DragEnd, ->
	newPosition = Utils.round(@y / imgSize.height, 0) * imgSize.height
	print newPosition
	if newPosition > 0
		newPosition = 0
	else if @maxY < imgSize.height
			newPosition = -(imgSize.height * (Cities.length - 1))
	@animate
		properties: y: newPosition

kenBurns = (layerName) ->
	layerName.animate
		delay: .2
		properties: x: -50, y: -100, scale: 1.3
		time: 30
		curve: "linear"
	
# Set up cities position and styles
for city, i in Cities
	city.x = 0
	city.height = imgSize.height
	city.y = (imgSize.height*i)
	city.superLayer = scrollLayer