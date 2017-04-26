module Ecco
  class AftenpostenAdapter < Adapter
    def initialize
      @root_uri = 'http://www.aftenposten.no/'
      @article_block = get_html(root_uri).css('.df-article-content')
      @article_url = article_block.css("a").first.attr('href')
      @full_article_page = get_html(article_url)
    end

    def data
      return SiteData.new(
        newspaper: "Aftenposten",
        headline: article_block.css('.df-fs-59').inner_text,
        description: full_article_page.css("p[itemprop=description]").text,
        link: URI.parse(article_url),
        image_url: URI.parse(article_block.css('img').first.attr('src')),
        article: full_article_page.css("div[itemprop=articleBody]").text
      )
    end
  end
end
