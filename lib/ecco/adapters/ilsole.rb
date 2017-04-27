module Ecco
  class IlsoleAdapter < Adapter
    def initialize
      @root_uri = 'http://www.ilsole24ore.com'
      @article_block = get_html(root_uri).css('.col-xs-7')
      @article_url = "http://www.ilsole24ore.com" + article_block.css('a').first.attr('href')
      @full_article_page = get_html(article_url)
    end

    def data
      SiteData.new(
        newspaper: "Il sole",
        headline: article_block.css('h3').inner_text,
        description: article_block.css('h3').first.inner_text,
        link: URI.parse(root_uri + article_block.css('a').first.attr('href')),
        image_url: URI.parse(article_block.css('img').first.attr('src')),
        article: full_article_page.css("div > p").text
      )
    end
  end
end
