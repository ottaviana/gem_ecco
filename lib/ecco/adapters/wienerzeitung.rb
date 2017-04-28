module Ecco
  class WienerzeitungAdapter < Adapter
    def initialize
      @root_uri = 'http://www.wienerzeitung.at/'
      @article_block = get_html(root_uri).css('.em_home_top_news')
      @article_url = "http://www.wienerzeitung.at/" + article_block.css("a").first.attr('href')
      @full_article_page = get_html(article_url)
    end

    def data
      return SiteData.new(
        newspaper: "Wienerzeitung",
        headline: article_block.css('h2').first.inner_text,
        description: article_block.css("ul[class=em_keyword_list]").first.text,
        link: URI.parse(article_url),
        image_url: URI.parse(root_uri + article_block.css('img').first.attr('src')),
        article: full_article_page.css("p[class=em_text]").text
      )
    end
  end
end
