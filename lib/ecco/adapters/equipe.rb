module Ecco
  class EquipeAdapter < Adapter
    def initialize
      @root_uri = 'http://www.lequipe.fr/'
      @article_block = get_html(root_uri).css('.home__lead')
      @article_url = "http://www.lequipe.fr/" + article_block.css("a").first.attr('href')
      @full_article_page = get_html(article_url)
    end

    def data
      return SiteData.new(
        newspaper: "L'ÉQUIPE",
        headline: article_block.css('h1').map { |n| "<a>" + n.text.strip() + "</a>" }.join,
        description: article_block.css(".home__lead__details").map { |n| "<p>" + n.text.strip() + "</p>" }.join,
        link: URI.parse(article_url),
        image_url: URI.parse(article_block.css('img').first.attr('src')),
        article: full_article_page.css("div[itemprop=mainEntityOfPage]").text
      )
    end
  end
end
