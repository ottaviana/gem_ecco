module Ecco
  class NrcAdapter < Adapter
    def initialize
      @root_uri = 'https://www.nrc.nl/'
      @article_block = get_html(root_uri).css('.nmt-item__inner')
      @article_url = "https://www.nrc.nl/" + article_block.css("a").first.attr('href')
      @full_article_page = get_html(article_url)


    end

    def data
      return SiteData.new(
        newspaper: "NRC",
        headline: article_block.css('.nmt-item__headline')[0].inner_text,
        description: article_block.css(".nmt-item__teaser")[0].inner_text,
        link: URI.parse(article_url),
        image_url: URI.parse(article_block.css('img').first.attr('src')),
        article: full_article_page.css("div > p").map { |n| "<p>" + n.text.strip() + "</p>" }.join
      )
    end
  end
end
