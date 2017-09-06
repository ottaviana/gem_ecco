module Ecco
  class Sport_chAdapter < Adapter
    def initialize
      @root_uri = 'http://www.sport.ch/'
      @article_block = get_html(root_uri).css('.sth_container')
      @article_url = 'http://www.sport.ch/'+ article_block.css(".topstory_title_link").first.attr('href')
      @full_article_page = get_html(article_url)
    end

    def data
      SiteData.new(
        newspaper: "Sport.ch",
        headline: article_block.css(".topstory_title_link").first.text,
        description: full_article_page.css('div > p').inner_text,
        link: URI.parse(root_uri + article_block.css('.topstory_title_link').first.attr('href')),
        image_url: URI.parse(root_uri + article_block.css('.sth_container_story').first.attr("style").split("|")[0].slice!(/photos[^\s]{1,}.jpg/)),
        article: full_article_page.css('div > p').inner_text
      )
    end
  end
end
