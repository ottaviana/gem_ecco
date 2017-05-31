module Ecco
  class ProtothemaAdapter < Adapter

    def initialize
      @root_uri = 'http://www.protothema.gr/'
      @article_block = get_html(root_uri).css('.slides')
      @article_url = "http://www.protothema.gr" + article_block.css('a').first.attr('href')
      @full_article_page = get_html(article_url)
    end

    def data
      return SiteData.new(
        newspaper: "Protothema",
        headline: article_block.css('.SuperTitle0').first.inner_text,
        description: article_block.css('div > h2').first.inner_text,
        link: URI.parse(article_url),
        image_url: URI.parse("http://www.protothema.gr" + article_block.css('img').first.attr('src')),
        article: full_article_page.css("div > p").text
      )
    end
  end
end
