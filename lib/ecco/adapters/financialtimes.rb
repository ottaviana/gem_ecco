module Ecco
  class FinancialtimesAdapter < Adapter
    def initialize
      @root_uri = 'https://www.ft.com/'
      @article_block = get_html(root_uri).css('.o-teaser__content')
      @article_url = "https://www.ft.com/" + article_block.css("a").first.attr('href')
      @full_article_page = get_html(article_url)
    end

    def data
      return SiteData.new(
        newspaper: "Finalcial Times",
        headline: article_block.css("a[class=js-teaser-heading-link]").first.text,
        description: article_block.css("p[class=o-teaser__standfirst]").first.text,
        link: URI.parse(article_url),
        image_url: URI.parse(root_uri + article_block.css('img').first.attr('src')),
        article: full_article_page.css("p[class=em_text]").text
      )
    end
  end
end
