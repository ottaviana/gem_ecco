module Ecco
  class FaktAdapter < Adapter

    def initialize
      @root_uri = 'http://www.fakt.pl/'
      @article_block = get_html(root_uri).css('.se')
      @article_url =  article_block.css('a').first.attr('href')
      @full_article_page = get_html(article_url)
    end

    def data
      return SiteData.new(
        newspaper: "Fakt",
        headline: article_block.css('.gradientRight')[0..3].inner_text,
        description: full_article_page.css(".hyphenate")[0].text,
        link: URI.parse(article_url),
        image_url: URI.parse('http:' + article_block.css('img')[0].attr('src')),
        article: full_article_page.css("p").text
      )
    end
  end
end
