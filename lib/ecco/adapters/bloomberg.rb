module Ecco
  class BloombergAdapter < Adapter
    def initialize
      @root_uri = 'https://www.bloomberg.com/markets'
      @article_block = get_html(root_uri).css('.for-hero-big-story-image-height')
      @article_url = "https://www.bloomberg.com/" + article_block.css("a").first.attr('href')
      @full_article_page = get_html(article_url)
    end

    def data
      return SiteData.new(
        newspaper: "Bloomberg",
        headline: article_block.css('div a').inner_text,
        description: full_article_page.css(".abstract__item-text").text,
        link: URI.parse(article_url),
        image_url: full_article_page.css(".lede-large-image__image").first.attr("style"),
        article: full_article_page.css(".body-copy").text
      )
    end
  end
