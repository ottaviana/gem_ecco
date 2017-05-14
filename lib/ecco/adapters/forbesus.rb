module Ecco
  class ForbesusAdapter < Adapter

    def initialize
      @root_uri = 'https://www.forbes.com/home_usa/#3a287558324b'
      @article_block = get_html(root_uri).css("head > script")[4].text
      @article_json = article_block[39..-63]
      @object = JSON.parse(@article_json)
      @article_object = @object["homepage-usa_58d4014b6b1c8"]["contentPositions"][0]
      @full_article_page = get_html(article_url)
        #full article to do scraping json
    end

    def data
      SiteData.new(
        newspaper: "Forbes US",
        headline: @article_object["title"],
        description: @article_object["description"],
        link: URI.parse(@article_object["uri"]),
        image_url: URI.parse(@article_object["image"]),
        article: full_article_page.css(".content__article-body").text
      )
    end
  end
end
