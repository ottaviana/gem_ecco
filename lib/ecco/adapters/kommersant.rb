module Ecco
  class KommersantAdapter < Adapter
    def initialize
      @root_uri = 'http://www.kommersant.ru/'
      @article_block = get_html(root_uri).css('.mainpost')
      @article_url = "http://www.kommersant.ru" + article_block.css('a').first.attr('href')
      @full_article_page = get_html(article_url)
    end

    def data
      SiteData.new(
        newspaper: "Kommersant",
        headline: article_block.css('a > text()').first.inner_text,
        description: article_block.css('.article_subheader').inner_text,
        link: URI.parse(root_uri + article_block.css('a').first.attr('href')),
        image_url: URI.parse(article_block.css('img').first.attr('src')),
        article: full_article_page.css("div > p").map { |n| "<p>" + n.text.strip() + "</p>" }.join
      )
    end
  end
end
