module Ecco
  class BerlingskeAdapter < Adapter

    def initialize
      @root_uri = 'https://www.b.dk/'
      @article_block = get_html(root_uri).css('.teaser')
      @article_url =  'https://www.b.dk/' + article_block.css('a')[1].attr('href')
      @full_article_page = get_html(article_url)
    end

    def data
      return SiteData.new(
        newspaper: "Berlingske",
        headline: article_block.css('.teaser-content')[0].inner_text,
        description: full_article_page.css(".article-body p")[0].text,
        link: URI.parse(article_url),
        image_url: URI.parse(article_block.css('img')[0].attr('src')),
        article: full_article_page.css(".article-body p").text
      )
    end
  end
end
