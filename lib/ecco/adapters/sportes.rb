module Ecco
  class SportAdapter < Adapter
    def initialize
      @root_uri = 'http://www.sport.es/es/'
      @article_block = get_html(root_uri).css("article[class='sp-noticia media']")
      @article_url = "http://www.sport.es" + article_block.css("a").first.attr('href')
      @full_article_page = get_html(article_url)
    end

    def data
      return SiteData.new(
        newspaper: "SPORT",
        headline: article_block.css('h1').map { |n| "<a>" + n.text.strip() + "</a>" }.join,
        description: full_article_page.css('.subtitle').inner_text,
        link: URI.parse(article_url),
        image_url: URI.parse(article_block.css('img').first.attr('src')),
        article: full_article_page.css("div > p").text
      )
    end
  end
end
