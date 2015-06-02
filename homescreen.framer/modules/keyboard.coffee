

exports.Keyboard = class Keyboard extends Layer
  constructor: (openYPosition, options = {}) ->
    options.image = "modules/images/keyboard_light.png"
    options.width = Framer.Device.screen.width
    options.height = Framer.Device.screen.height - openYPosition
    options.y = Framer.Device.screen.height

    super options

    @openYPosition = openYPosition
    @closedYPosition = options.y

    attachToLayer: (layer) ->
      layer.on Events.Click, =>
        if @y == @openYPosition
          newY = @closedYPosition
        else
          newY = @openYPosition
        @animate
          properties: y: newY
          time: .3