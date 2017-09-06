module Ecco
  class ExpansionAdapter < Adapter
    def initialize
      @root_uri = 'http://www.expansion.com/'
      @article_block = get_html(root_uri).css('.noticia')
      @article_url = article_block.css("a").first.attr('href')
      @full_article_page = get_html(article_url)
    end

    def data
      SiteData.new(
        newspaper: "Expansion",
        headline: article_block.css('.izquierda')[0].text,
        description: article_block.css('.entradilla')[0].text,
        link: URI.parse(article_block.css('a').first.attr('href')),
        image_url: URI.parse("http:" + article_block.css('img').first.attr("src")),
        article: full_article_page.css('div > p').inner_text
      )
    end
  end
end
