class window.Parser
  constructor: ->
    @cards = $('.list-card-details a')
    @cards.each (index, element) =>
      @parseCard index, $(element)

  parseCard: (index, element) ->
    type = @cardType element
    return unless type
    card = new Card
      type: type
      element: element

  cardType: (element) ->
    switch
      when Card.patterns().bug.test(element.text()) then 'bug'
      when Card.patterns().feature.test(element.text()) then 'feature'
      when Card.patterns().refactor.test(element.text()) then 'refactor'
      when Card.patterns().layout.test(element.text()) then 'layout'