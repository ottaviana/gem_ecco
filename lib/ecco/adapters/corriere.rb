module Ecco
  class CorriereAdapter < Adapter
    attr_reader :page

    def initialize
      @root_uri = 'http://www.corriere.it/'
      @page = get_html(root_uri)
      @article_block = @page.css("section.main-content > section").first
      @article_url = article_block.css("article a").first.attr('href')
      @full_article_page = get_html(article_url)
    end

    def data
      return SiteData.new(
        newspaper: "Corriere della Sera",
        headline: article_block.css('.title_art a').inner_text,
        description: article_block.css(".mbl_summaryLink").inner_text,
        link: URI.parse(article_url),
        image_url: URI.parse(article_block.css(".nolazy").attr('src')),
        article: full_article_page.css("div > p").text
      )
    end
  end
end
