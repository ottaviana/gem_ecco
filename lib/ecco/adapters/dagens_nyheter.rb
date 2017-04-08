module Ecco
  class DagensnyheterAdapter < Adapter
    def initialize
      @root_uri = 'http://www.dn.se/'
      @article_block = get_html(@root_uri).css('.twin-teaser-wrapper')
      @article_url = "http://www.dn.se" + article_block.css('a').first.attr('href')
      @full_article_page = get_html(article_url)

    end

    def data
      return SiteData.new(
        newspaper: "Dagens Nyheter",
        headline: article_block.css('.article-teaser__title-text')[0].inner_text,
        description: article_block.css(".article-teaser__summary")[0].inner_text,
        link: URI.parse(article_url),
        image_url: URI.parse(article_block.css('img').first.attr('src')),
        article: full_article_page.css("div > p").map { |n| "<p>" + n.text.strip() + "</p>" }.join
      )
    end
  end
end
