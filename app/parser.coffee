class window.Parser
  constructor: ->
    console.log 'parser'
    @cards = $('.list-card-details a')
    @cards.each (index, element) =>
      console.log 'foooo====>', index, element
      @parseCard index, $(element)

  parseCard: (index, element) ->
    console.log 'parseCard'
    type = @cardType element
    return unless type
    card = new Card
      type: type
      title: element.text()
    console.log 'card===>', card
    @changeCardTitle element, card
    @appendBadge element, card

  cardType: (element) ->
    switch
      when Card.patterns().bug.test(element.text()) then 'bug'
      when Card.patterns().feature.test(element.text()) then 'feature'
      when Card.patterns().refactor.test(element.text()) then 'refactor'
      when Card.patterns().layout.test(element.text()) then 'layout'

  changeCardTitle: (element, card) ->
    element.html card.title

  createBadgeHtml: (card) ->
    div = $('<div>', { title: card.badgeTitle, class: "badge badge-card-type badge-state-complete #{ card.cssClass }" })
    span = $('<span>', { class: 'badge-text', text: card.type })
    div.html span

  appendBadge: (element, card) ->
    element.parent().find('.badges').append(@createBadgeHtml(card));