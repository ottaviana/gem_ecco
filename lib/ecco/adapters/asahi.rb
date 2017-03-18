module Ecco
  class AsahiAdapter < Adapter
    def initialize
      @root_uri = 'http://www.asahi.com/ajw/'
      @article_block = get_html(@root_uri).css('.Fst')[1]
      @article_url = article_block.css("a").first.attr('href')
      @full_article_page = get_html(article_url)

    end

    def data
      return SiteData.new(
        newspaper: "The Asahi Shimbun",
        headline: article_block.css('.EnTopHeadline').inner_text,
        description: article_block.css(".Lead").inner_text,
        link: URI.parse(article_url),
        image_url: URI.parse(article_block.css('img').first.attr('src')),
        article: full_article_page.css("div > p").text
      )
    end
  end
end
