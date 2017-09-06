module Ecco
  class Sky_sportAdapter < Adapter
    def initialize
      @root_uri = 'http://www.skysports.com/'
      @article_block = get_html(root_uri).css('.sdc-site-tiles__item')
      @article_url = 'http://www.skysports.com/'+ article_block.css("h3 >a").first.attr('href')
      @full_article_page = get_html(article_url)
    end

    def data
      SiteData.new(
        newspaper: "Sky Sport",
        headline: article_block.css(".sdc-site-tile__headline-text").first.text,
        description: full_article_page.css("p[itemprop=description]").text,
        link: URI.parse(root_uri + article_block.css('h3 > a').first.attr('href')),
        image_url: URI.parse(article_block.css('img').first.attr("src")),
        article: full_article_page.css('div > p').inner_text
      )
    end
  end
end
