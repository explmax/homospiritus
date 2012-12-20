
$ ->
  converter = new Showdown.converter()

  $('.markdown').each ->
    md    = $(this).html()
    html  = converter.makeHtml(md)
    $(this).html(html)
