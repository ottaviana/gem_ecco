module Ecco
  class Japan_sportAdapter < Adapter
    def initialize
      @root_uri = 'https://www.japantimes.co.jp/sports/'
      @article_block = get_html(root_uri).css('.story')
      @article_url = article_block.css("a").first.attr('href')
      @full_article_page = get_html(article_url)
    end

    def data
      SiteData.new(
        newspaper: "Japan Sport",
        headline: article_block.css("h1").first.text,
        description: article_block.css('div > p').first.inner_text,
        link: URI.parse(article_block.css('a').first.attr('href')),
        image_url: URI.parse(article_block.css('img').first.attr("src")),
        article: full_article_page.css('div > p').inner_text
      )
    end
  end
end
