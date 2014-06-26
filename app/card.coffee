class window.Card
  constructor: (options) ->
    @type = options.type
    @title = options.title
    @setTitle()
    @setCssClass()
    @setBadgeTitle()

  @patterns: ->
    bug: /\[bug\]/
    feature: /\[feature\]/
    refactor: /\[refactor\]/
    layout: /\[layout\]/
    number: /^#\d+/

  setTitle: ->
    @title = @title.replace(Card.patterns()[@type], '').replace(Card.patterns().number, '')

  setCssClass: ->
    @cssClass = ".card-#{ @type }"

  setBadgeTitle: ->
    @badgeTitle = "This card is a #{ @type } card."