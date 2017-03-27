module Ecco
  class CorriereAdapter < Adapter
    def initialize
      @root_uri = 'http://www.corriere.it/'
      @page = get_html(root_uri)
      @article_block = @page.css(".md_ap_sp2")
      #@article_block = @page.css(".content_bk")
      @article_url = article_block.css("article a").first.attr('href')
      @full_article_page = get_html(article_url)
    end

    def data
      return SiteData.new(
        newspaper: "Corriere della Sera",
        headline: article_block.css('.title_art a').inner_text,
        description: article_block.css(".mbl_summaryLink").inner_text,
        link: URI.parse(article_url),
        image_url: URI.parse(full_article_page.css("div > img").first.attr('data-original')),
        article: full_article_page.css("div > p").text
      )
    end
  end
end
