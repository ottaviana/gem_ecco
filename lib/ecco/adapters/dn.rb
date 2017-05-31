module Ecco
  class DnAdapter < Adapter

    def initialize
      @root_uri = 'http://www.dn.pt/'
      @article_block = get_html(root_uri).css('.t-featured-card-1')
      @article_url = "http://www.dn.pt/" + article_block.css('a').first.attr('href')
      @full_article_page = get_html(article_url)
    end

    def data
      return SiteData.new(
        newspaper: "Diario de Noticias",
        headline: article_block.css("h2[itemprop=headline]").inner_text,
        description: article_block.css("h4[itemprop=description]").inner_text,
        link: URI.parse(article_url),
        image_url: URI.parse(article_block.css('img[itemprop="thumbnailUrl image"]').first.attr('src')),
        article: full_article_page.css("div > p").text
      )
    end
  end
end
