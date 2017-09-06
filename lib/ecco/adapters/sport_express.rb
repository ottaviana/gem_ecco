module Ecco
  class Sport_expressAdapter < Adapter
    def initialize
      @root_uri = 'https://www.sport-express.ru/'
      @article_block = get_html(root_uri).css('.collage_22')
      @article_url = article_block.css("a").first.attr('href')
      @full_article_page = get_html(article_url)
    end

    def data
      SiteData.new(
        newspaper: "Sport Express",
        headline: article_block.css(".lh_30").first.text,
        description: article_block.css(".lh_15").first.text,
        link: URI.parse(root_uri + article_block.css('a').first.attr('href')),
        image_url: URI.parse(article_block.css('img').first.attr("src")),
        article: full_article_page.css('div > p').inner_text
      )
    end
  end
end
