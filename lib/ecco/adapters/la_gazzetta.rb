module Ecco
  class GazzettaAdapter < Adapter
    def initialize
      @root_uri = 'http://www.gazzetta.it/'
      @article_block = get_html(root_uri).css('.u011-opener-article-column')
      @article_url = article_block.css("a").first.attr('href')
      @full_article_page = get_html(article_url)
      binding.pry

    end

    def data
      return SiteData.new(
        newspaper: "La Gazzetta dello sport",
        headline: article_block.css('a').first.attr('title'),
        description: article_block.css("div > h3").inner_text,
        link: URI.parse(article_url),
        image_url: URI.parse(article_block.css('img').first.attr('src')),
        article: full_article_page.css(".desc-article").map { |n| "<p>" + n.text.strip() + "</p>" }.join
      )
    end
  end
end
