module Ecco
  class LemondeAdapter < Adapter
    def initialize
      @root_uri = 'http://www.lemonde.fr'
      @article_block = get_html(root_uri).css('.titre_une')
      @article_url = "http://www.lemonde.fr" + article_block.css('a').first.attr('href')
      @full_article_page = get_html(article_url)
    end

    def data
      SiteData.new(
        newspaper: "Le Monde",
        headline: article_block.css('a > h1 > text()').first.inner_text,
        description: article_block.css('.description').inner_text,
        link: URI.parse(root_uri + article_block.css('a').first.attr('href')),
        image_url: URI.parse(article_block.css('img').first.attr('src')),
        article: full_article_page.css("div[itemprop=articleBody]").text
      )
    end
  end
end
