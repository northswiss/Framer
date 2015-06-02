# This imports all the layers for "Results-Detail" into resultsDetailLayers
L = Framer.Importer.load "imported/Results-Detail"

bg = new BackgroundLayer({backgroundColor:"white"})
  
# INITIALIZE
# ----------------------------------

# Default Animation Options
Framer.Defaults.Animation =
  curve: "spring(260, 30, 0, 0.1)"
  
# FILTERS
# ----------------------------------

filterContent = new Layer
	backgroundColor: '#fff', width: 1080, height: 1920, y: 1920

fabMask = new Layer
	backgroundColor: 'transparent', width: 1080, height: 168, y: 1596, zIndex: 10
	
fabMask.states.add 'fabMask_active',
	y: 0
	
fabBtn = new Layer
	backgroundColor: '#FA7F19', borderRadius: 89, width: 168, height: 168, x: 864, y: 0, zIndex: 10
	superLayer: fabMask
	
fabBtn.states.add 'fabBtn_active',
	borderRadius: 0, x: 0,	y: 0, width: 1080
	animate : {
		backgroundColor: '#10ACC9'
	}
		

# DETAILS
# ----------------------------------
  
L.DETAIL.visible = true
L.detail_summary.y = 1960
L.detail_prices.y = 1960
L.detail_gradient.y = -192
# App bar
L.app_bar.states.add 'detail_app_bar', 
	opacity: 0, scale: .9
	
# Initialise text for the second result item
hotelName = new Layer
	backgroundColor: false, color : '#fff', x: 48, y: 1400, height: 100, width: 560
	
hotelName.html = 'NH Barcelona Centro'
hotelName.style = 
	fontSize : '48px',	fontFamily : 'Roboto',	padding : '4px 0'

hotelName.states.add 'detail_hotel_name',
	color: '#000000', delay: 20, x: 164, y: 730, scale: 1.5

# Hide other results
L.result1.states.add 'detail_result1',
	opacity: 0, scale: .9
L.result3.states.add 'detail_result1',
	opacity: 0, scale: .9

#Hotel image
L.result_image.states.add 'detail_image', 
	width: 1080, x: 0, y: 72
	
# Fav icon
L.icon_fav.states.add 'detail_icon_fav',
	x: 960, y: 120, index: 100
# Hotel name
L.hotel_name.states.add 'detail_hotel_name',
	color : '#000', x: 48, y: 730
		
# Hide footer stuff from results
L.result_footer.states.add 'detail_result_footer',
	opacity: 0
	
# FAB button
L.btn_fab.states.add 'detail_btn_fab',
	y: 1920
	
# Total price
L.total_price.states.add 'detail_total_price',
	y: 1920
	
	
L.detail_gradient.states.add 'detail_gradient',
	y: 96

# Add a multiple states
L.detail_summary.states.add 'detail_summary',
	y: 682

L.detail_prices.states.add 'detail_prices',
	y: 1543
	
hideStuff = (layer) ->
	layer.animate({
		properties: {
			scale: .9
			y: 100			
		}
	})

showStuff = (layer) ->
	layer.animate({
		properties: {
			scale: 1
			y: 0
		}
	})
	
# DETAIL TRANSITION
L.result_image.on Events.Click, ->
	myArray = [	L.result1,L.result3,
		L.result_image,
		L.icon_fav,
		L.detail_gradient,
		L.app_bar,
		hotelName,
		L.result_footer
		L.btn_fab,
		L.total_price,
		L.detail_summary,
		L.detail_prices]
	for myLayers in myArray
		myLayers.states.next()
	
fabBtn.on Events.Click, ->
	fabBtn.states.next()
	fabMask.states.next()
	hideStuff(L.group_results)
	
