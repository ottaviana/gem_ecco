module Ecco
  class AdevarulAdapter < Adapter
    def initialize
      @root_uri = 'http://adevarul.ro/'
      @article_block = get_html(root_uri).css('.deschidere3')
      @article_url = "http://adevarul.ro/" + article_block.css('a').first.attr('href')
      @full_article_page = get_html(article_url)

    end

    def data
      return SiteData.new(
        newspaper: "Adevarul",
        headline: article_block.css('h2[itemscope=headline]').map { |n| "<a>" + n.text.strip() + "</a>" }.join,
        description: article_block.css('h3[itemprop=alternativeHeadline]').map { |n| "<a>" + n.text.strip() + "</a>" }.join,
        link: URI.parse(article_url),
        image_url: URI.parse('http://adevarul.ro/' + article_block.css('img').first.attr('src')),
        article: full_article_page.css(".article-body").map { |n| "<p>" + n.text.strip() + "</p>" }.join
      )
    end
  end
end
