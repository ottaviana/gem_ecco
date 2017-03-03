module Ecco
  class ElpaisAdapter < Adapter
    def initialize
      @root_uri = 'http://elpais.com'
      @article_block = get_html(root_uri).css('.articulo.articulo--primero')
      @article_url = "http://elpais.com" + article_block.css('a').first.attr('href')
      @full_article_page = get_html(article_url)
    end

    def data
      SiteData.new(
        newspaper: "El País",
        headline: article_block.css('h2').inner_text,
        description: article_block.css('.articulo-entradilla').inner_text,
        link: URI.parse(root_uri + article_block.css('a').first.attr('href')),
        image_url: URI.parse(article_block.css('img').first.attr('data-src')),
        article: full_article_page.css("div[itemprop=articleBody]").text
      )
    end
  end
end
