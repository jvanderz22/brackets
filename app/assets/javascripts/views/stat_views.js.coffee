App.StatView = Ember.View.extend
  tagName: 'span'
  classNames: ['styled-stat-box']
  classNameBindings: ['displayBottom:styled-stat-box-bottom']
  attributeBindings: ['color:style']
  displayBottom: ( ->
    @get('bottom')? && @get('bottom') == true
  ).property('bottom')
  color: ( ->
    dechex = ( (d) ->
      d.toString(16)
    )
    addZeroToHex = ( (d, h) ->
      h = "0" + h if (d < 16)
      h.substr(0, 2)
    )

    rank = Number(@get('rank'))
    totalTeams = 351
    decimalColor = (rank - 1) / (totalTeams - 1)
    if decimalColor <= .5
      fraction = Math.pow(1 - ((.5 - decimalColor) / .5), .2)
      red = 94.9 * fraction
      green = ((1 - fraction) * 1.96) + 98.04
      blue = 99.22 * fraction
    else
      fraction = Math.pow(1 + ((.5 - decimalColor) / .5), .2)
      red = ((1 - fraction) * 5.1) + 94.9
      green = 94.84 * fraction
      blue = 99.22 * fraction
    red = 2.55 * red
    green = 2.55 * green
    blue = 2.55 * blue
    hexRed = dechex(red)
    hexGreen = dechex(green)
    hexBlue = dechex(blue)
    hexRed = addZeroToHex(red, hexRed)
    hexGreen = addZeroToHex(green, hexGreen)
    hexBlue = addZeroToHex(blue, hexBlue)
    "background-color: #" + "#{hexRed}#{hexGreen}#{hexBlue}"
  ).property('rank')
