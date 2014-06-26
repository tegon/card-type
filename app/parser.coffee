class window.Parser
  constructor: ->
    @cards = $('.list-card-details a')
    @cards.each (index, element) => @parseCard index, $(element)

  parseCard: (index, element) ->
    type = @cardType element
    return unless type
    card = new Card
      type: type
      title: element.text()
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
    div = $('<div>', { title: card.badgeTitle, class: 'badge badge-card-type' })
    span = $('<span>', { class: "badge-text #{ card.cssClass }", text: card.type })
    div.html span

  appendBadge: (element, card) ->
    element.parent().find('.badges').append(@createBadgeHtml(card));