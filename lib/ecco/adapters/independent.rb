module Ecco
  class IndependentAdapter < Adapter
    def initialize
      @root_uri = 'https://www.independent.ie/news/'
      @article_block = get_html(root_uri).css('.w111')
      @article_url = article_block.css("article a").first.attr('href')
      @full_article_page = get_html(article_url)
    end

    def data
      SiteData.new(
        newspaper: "Independent",
        headline: article_block.css("h2 span").first.text,
        description: full_article_page.css('.ctx_content').first.inner_text,
        link: URI.parse(root_uri + article_block.css('a').first.attr('href')),
        image_url: URI.parse(article_block.css('img').first.attr('src')),
        article: full_article_page.css('.ctx_content').inner_text
      )
    end
  end
end
