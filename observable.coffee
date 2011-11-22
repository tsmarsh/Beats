class exports.Observable
  constructor: ->
    @observers = {}
    @self = $ this

  registerObserver: (event, callback) ->
    @self.bind event, callback

  notifyObservers: (event, optionalArgs) ->
    @self.trigger event, optionalArgs

  unregisterObserver: (event, callback) ->
    @self.unbind event, callback
