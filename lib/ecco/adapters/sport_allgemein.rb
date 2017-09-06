module Ecco
  class Sport_allgemeinAdapter < Adapter
    def initialize
      @root_uri = 'http://www.sport.de/'
      @article_block = get_html(root_uri).css('.hs-row')
      @article_url = 'http://www.sport.de/'+ article_block.css("div > a").first.attr('href')
      @full_article_page = get_html(article_url)
    end

    def data
      SiteData.new(
        newspaper: "Sport Allgemein",
        headline: article_block.css('.hs-news-headline').first.text,
        description: full_article_page.css("div > p")[0].text,
        link: URI.parse(root_uri + article_block.css('div > a').first.attr('href')),
        image_url: URI.parse(article_block.css('img').first.attr('src')),
        article: full_article_page.css('div > p').inner_text
      )
    end
  end
end
