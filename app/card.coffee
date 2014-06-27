class window.Card
  constructor: (options) ->
    @type = options.type
    @element = options.element
    @update()
    @mouseUpEvent()

  @patterns: ->
    bug: /\[bug\]/
    feature: /\[feature\]/
    refactor: /\[refactor\]/
    layout: /\[layout\]/
    number: /^#\d+/

  setTitle: ->
    @title = @element.text().replace(Card.patterns()[@type], '').replace(Card.patterns().number, '').trim()

  setCssClass: ->
    @cssClass = "card-#{ @type }"

  setBadgeTitle: ->
    @badgeTitle = "This card is a #{ @type } card."

  changeCardTitle: ->
    children = @element.children()
    @element.text @title
    @element.prepend children

  createBadgeHtml: ->
    div = $('<div>', { title: @badgeTitle, class: "badge badge-card-type badge-state-complete #{ @cssClass }" })
    span = $('<span>', { class: 'badge-text', text: @type })
    div.html span

  appendBadge: ->
    @element.parent().find('.badges').append(@createBadgeHtml());

  update: ->
    @setTitle()
    @setCssClass()
    @setBadgeTitle()
    @changeCardTitle()
    @appendBadge()

  mouseUpEvent: ->
    console.log 'oooooooooooooooooo', @element
    @element.on 'mouseup', =>
      console.log 'mouseup', @
      @update()