require=(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({"keyboard":[function(require,module,exports){
var Keyboard,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

exports.Keyboard = Keyboard = (function(superClass) {
  extend(Keyboard, superClass);

  function Keyboard(openYPosition, options) {
    if (options == null) {
      options = {};
    }
    options.image = "modules/images/keyboard_light.png";
    options.width = Framer.Device.screen.width;
    options.height = Framer.Device.screen.height - openYPosition;
    options.y = Framer.Device.screen.height;
    Keyboard.__super__.constructor.call(this, options);
    this.openYPosition = openYPosition;
    this.closedYPosition = options.y;
    ({
      attachToLayer: function(layer) {
        return layer.on(Events.Click, (function(_this) {
          return function() {
            var newY;
            if (_this.y === _this.openYPosition) {
              newY = _this.closedYPosition;
            } else {
              newY = _this.openYPosition;
            }
            return _this.animate({
              properties: {
                y: newY
              },
              time: .3
            });
          };
        })(this));
      }
    });
  }

  return Keyboard;

})(Layer);



},{}],"myModule":[function(require,module,exports){
exports.myVar = "myVariable";

exports.myFunction = function() {
  return print("myFunction is running");
};

exports.myArray = [1, 2, 3];



},{}]},{},[])
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIm5vZGVfbW9kdWxlcy9icm93c2VyaWZ5L25vZGVfbW9kdWxlcy9icm93c2VyLXBhY2svX3ByZWx1ZGUuanMiLCIvVXNlcnMvY2hyaXNyb3kvRHJvcGJveC9TdGF5L0Rlc2lnbi9XSVAvQW5kcm9pZC9BbmltYXRpb25zL0ZyYW1lci9ob21lc2NyZWVuLmZyYW1lci9tb2R1bGVzL2tleWJvYXJkLmNvZmZlZSIsIi9Vc2Vycy9jaHJpc3JveS9Ecm9wYm94L1N0YXkvRGVzaWduL1dJUC9BbmRyb2lkL0FuaW1hdGlvbnMvRnJhbWVyL2hvbWVzY3JlZW4uZnJhbWVyL21vZHVsZXMvbXlNb2R1bGUuY29mZmVlIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiJBQUFBO0FDRUEsSUFBQSxRQUFBO0VBQUE7NkJBQUE7O0FBQUEsT0FBTyxDQUFDLFFBQVIsR0FBeUI7QUFDdkIsOEJBQUEsQ0FBQTs7QUFBYSxFQUFBLGtCQUFDLGFBQUQsRUFBZ0IsT0FBaEIsR0FBQTs7TUFBZ0IsVUFBVTtLQUNyQztBQUFBLElBQUEsT0FBTyxDQUFDLEtBQVIsR0FBZ0IsbUNBQWhCLENBQUE7QUFBQSxJQUNBLE9BQU8sQ0FBQyxLQUFSLEdBQWdCLE1BQU0sQ0FBQyxNQUFNLENBQUMsTUFBTSxDQUFDLEtBRHJDLENBQUE7QUFBQSxJQUVBLE9BQU8sQ0FBQyxNQUFSLEdBQWlCLE1BQU0sQ0FBQyxNQUFNLENBQUMsTUFBTSxDQUFDLE1BQXJCLEdBQThCLGFBRi9DLENBQUE7QUFBQSxJQUdBLE9BQU8sQ0FBQyxDQUFSLEdBQVksTUFBTSxDQUFDLE1BQU0sQ0FBQyxNQUFNLENBQUMsTUFIakMsQ0FBQTtBQUFBLElBS0EsMENBQU0sT0FBTixDQUxBLENBQUE7QUFBQSxJQU9BLElBQUMsQ0FBQSxhQUFELEdBQWlCLGFBUGpCLENBQUE7QUFBQSxJQVFBLElBQUMsQ0FBQSxlQUFELEdBQW1CLE9BQU8sQ0FBQyxDQVIzQixDQUFBO0FBQUEsSUFVQSxDQUFBO0FBQUEsTUFBQSxhQUFBLEVBQWUsU0FBQyxLQUFELEdBQUE7ZUFDYixLQUFLLENBQUMsRUFBTixDQUFTLE1BQU0sQ0FBQyxLQUFoQixFQUF1QixDQUFBLFNBQUEsS0FBQSxHQUFBO2lCQUFBLFNBQUEsR0FBQTtBQUNyQixnQkFBQSxJQUFBO0FBQUEsWUFBQSxJQUFHLEtBQUMsQ0FBQSxDQUFELEtBQU0sS0FBQyxDQUFBLGFBQVY7QUFDRSxjQUFBLElBQUEsR0FBTyxLQUFDLENBQUEsZUFBUixDQURGO2FBQUEsTUFBQTtBQUdFLGNBQUEsSUFBQSxHQUFPLEtBQUMsQ0FBQSxhQUFSLENBSEY7YUFBQTttQkFJQSxLQUFDLENBQUEsT0FBRCxDQUNFO0FBQUEsY0FBQSxVQUFBLEVBQVk7QUFBQSxnQkFBQSxDQUFBLEVBQUcsSUFBSDtlQUFaO0FBQUEsY0FDQSxJQUFBLEVBQU0sRUFETjthQURGLEVBTHFCO1VBQUEsRUFBQTtRQUFBLENBQUEsQ0FBQSxDQUFBLElBQUEsQ0FBdkIsRUFEYTtNQUFBLENBQWY7S0FBQSxDQVZBLENBRFc7RUFBQSxDQUFiOztrQkFBQTs7R0FEd0MsTUFBMUMsQ0FBQTs7Ozs7QUNFQSxPQUFPLENBQUMsS0FBUixHQUFnQixZQUFoQixDQUFBOztBQUFBLE9BRU8sQ0FBQyxVQUFSLEdBQXFCLFNBQUEsR0FBQTtTQUNwQixLQUFBLENBQU0sdUJBQU4sRUFEb0I7QUFBQSxDQUZyQixDQUFBOztBQUFBLE9BS08sQ0FBQyxPQUFSLEdBQWtCLENBQUMsQ0FBRCxFQUFJLENBQUosRUFBTyxDQUFQLENBTGxCLENBQUEiLCJmaWxlIjoiZ2VuZXJhdGVkLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXNDb250ZW50IjpbIihmdW5jdGlvbiBlKHQsbixyKXtmdW5jdGlvbiBzKG8sdSl7aWYoIW5bb10pe2lmKCF0W29dKXt2YXIgYT10eXBlb2YgcmVxdWlyZT09XCJmdW5jdGlvblwiJiZyZXF1aXJlO2lmKCF1JiZhKXJldHVybiBhKG8sITApO2lmKGkpcmV0dXJuIGkobywhMCk7dmFyIGY9bmV3IEVycm9yKFwiQ2Fubm90IGZpbmQgbW9kdWxlICdcIitvK1wiJ1wiKTt0aHJvdyBmLmNvZGU9XCJNT0RVTEVfTk9UX0ZPVU5EXCIsZn12YXIgbD1uW29dPXtleHBvcnRzOnt9fTt0W29dWzBdLmNhbGwobC5leHBvcnRzLGZ1bmN0aW9uKGUpe3ZhciBuPXRbb11bMV1bZV07cmV0dXJuIHMobj9uOmUpfSxsLGwuZXhwb3J0cyxlLHQsbixyKX1yZXR1cm4gbltvXS5leHBvcnRzfXZhciBpPXR5cGVvZiByZXF1aXJlPT1cImZ1bmN0aW9uXCImJnJlcXVpcmU7Zm9yKHZhciBvPTA7bzxyLmxlbmd0aDtvKyspcyhyW29dKTtyZXR1cm4gc30pIiwiXG5cbmV4cG9ydHMuS2V5Ym9hcmQgPSBjbGFzcyBLZXlib2FyZCBleHRlbmRzIExheWVyXG4gIGNvbnN0cnVjdG9yOiAob3BlbllQb3NpdGlvbiwgb3B0aW9ucyA9IHt9KSAtPlxuICAgIG9wdGlvbnMuaW1hZ2UgPSBcIm1vZHVsZXMvaW1hZ2VzL2tleWJvYXJkX2xpZ2h0LnBuZ1wiXG4gICAgb3B0aW9ucy53aWR0aCA9IEZyYW1lci5EZXZpY2Uuc2NyZWVuLndpZHRoXG4gICAgb3B0aW9ucy5oZWlnaHQgPSBGcmFtZXIuRGV2aWNlLnNjcmVlbi5oZWlnaHQgLSBvcGVuWVBvc2l0aW9uXG4gICAgb3B0aW9ucy55ID0gRnJhbWVyLkRldmljZS5zY3JlZW4uaGVpZ2h0XG5cbiAgICBzdXBlciBvcHRpb25zXG5cbiAgICBAb3BlbllQb3NpdGlvbiA9IG9wZW5ZUG9zaXRpb25cbiAgICBAY2xvc2VkWVBvc2l0aW9uID0gb3B0aW9ucy55XG5cbiAgICBhdHRhY2hUb0xheWVyOiAobGF5ZXIpIC0+XG4gICAgICBsYXllci5vbiBFdmVudHMuQ2xpY2ssID0+XG4gICAgICAgIGlmIEB5ID09IEBvcGVuWVBvc2l0aW9uXG4gICAgICAgICAgbmV3WSA9IEBjbG9zZWRZUG9zaXRpb25cbiAgICAgICAgZWxzZVxuICAgICAgICAgIG5ld1kgPSBAb3BlbllQb3NpdGlvblxuICAgICAgICBAYW5pbWF0ZVxuICAgICAgICAgIHByb3BlcnRpZXM6IHk6IG5ld1lcbiAgICAgICAgICB0aW1lOiAuMyIsIiMgQWRkIHRoZSBmb2xsb3dpbmcgbGluZSB0byB5b3VyIHByb2plY3QgaW4gRnJhbWVyIFN0dWRpby4gXG4jIG15TW9kdWxlID0gcmVxdWlyZSBcIm15TW9kdWxlXCJcbiMgUmVmZXJlbmNlIHRoZSBjb250ZW50cyBieSBuYW1lLCBsaWtlIG15TW9kdWxlLm15RnVuY3Rpb24oKSBvciBteU1vZHVsZS5teVZhclxuXG5leHBvcnRzLm15VmFyID0gXCJteVZhcmlhYmxlXCJcblxuZXhwb3J0cy5teUZ1bmN0aW9uID0gLT5cblx0cHJpbnQgXCJteUZ1bmN0aW9uIGlzIHJ1bm5pbmdcIlxuXG5leHBvcnRzLm15QXJyYXkgPSBbMSwgMiwgM10iXX0=
