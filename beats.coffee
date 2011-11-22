$ ->

$.widget "tailoredshapes.flipper", {
  _create: ->
    @model = new FlipperModel()
    @view = new FlipperView(model, this.element)
    @controller = new FlipperController(model, view)

  destroy: ->
    @view.resetDOM()
}
class exports.FlipperView
  constructor: (@model, @baseElement) ->
    @buildDom()

  buildDOM: ->
    @bottomBack = $('<div class="flip bottom back">')
    @topFront = $('<div class="flip top front hide">')
    @topBack = $('<div class="flip top back">')
    @baseElement.append(
      @bottomBack, @topFront, @topBack
    )

  resetDOM: ->
    @baseElement.html ''

class exports.FlipperController
  constructor: (@view, @model) ->
    @tickTimer = exports.setInterval(this.tick, 50)

  tick: ->
    @model.increment()


class exports.FlipperModel extends Observable

  constructor: (initialValue = 0) ->
    @beatsInADay = 1000
    @secondsInADay
    @beatConstant = @beatsInADay / @secondsInADay
    @currentBeat = 0

  calculateBeats(currentTimeInSeconds) ->
    secondsSinceMidnight = currentTimeInSeconds % @secondsInADay
    return secondsSinceMidnight * @beatConstant

  update: (currentTimeInSeconds) ->
    
