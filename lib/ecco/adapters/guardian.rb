module Ecco
  class GuardianAdapter < Adapter

    def initialize
      @root_uri = 'https://www.theguardian.com/international'
      @article_block = get_html(root_uri)
      @article_url = article_block.css('.u-faux-block-link__overlay').first.attr('href')
      @full_article_page = get_html(article_url)
    end

    def data
      SiteData.new(
        newspaper: "The Guardian",
        headline: article_block.css('.fc-item__content .fc-item__header').first.inner_text,
        description: article_block.css('.fc-item__content .fc-item__standfirst').first.content,
        link: URI.parse(article_block.css('.u-faux-block-link__overlay').first.attr('href')),
        image_url: URI.parse(article_block.css('.responsive-img').first.attr('src')),
        article: full_article_page.css(".content__article-body").text
      )
    end
  end
end
