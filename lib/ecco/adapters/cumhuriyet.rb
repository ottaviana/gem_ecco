module Ecco
  class CumhuriyetAdapter < Adapter
    def initialize
      @root_uri = 'http://www.cumhuriyet.com.tr'
      @article_block = get_html(root_uri).css(".imgNews")
      @article_url = "http://www.cumhuriyet.com.tr/" + article_block.css("a").first.attr('href')
      @full_article_page = get_html(article_url)
    end

    def data
      return SiteData.new(
        newspaper: "Cumhuriyet",
        headline: article_block.css("span[class=caption]").first.text,
        description: full_article_page.css('.news-short').text,
        link: URI.parse(article_url),
        image_url: URI.parse(root_uri + article_block.css('img').first.attr('src')),
        article: full_article_page.css("div > p").text
      )
    end
  end
end
