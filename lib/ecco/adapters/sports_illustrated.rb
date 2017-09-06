module Ecco
  class Sports_illustratedAdapter < Adapter
    def initialize
      @root_uri = 'https://www.si.com/'
      @article_block = get_html(root_uri).css('.well')
      @article_url = 'https://www.si.com/'+ article_block.css("a").first.attr('href')
      @full_article_page = get_html(article_url)
    end

    def data
      SiteData.new(
        newspaper: "Sports Illustrated",
        headline: article_block.css('.headline').first.text,
        description: article_block.css('.summary').first.inner_text,
        link: URI.parse(root_uri + article_block.css('a').first.attr('href')),
        image_url: URI.parse(article_block.css('img').first.attr('src')),
        article: full_article_page.css('div > p').inner_text
      )
    end
  end
end
