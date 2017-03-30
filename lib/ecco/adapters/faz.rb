module Ecco
  class FazAdapter < Adapter
    def initialize

      @root_uri = 'http://www.faz.net/'
      @article_block = get_html(root_uri).css('.PackageInner.top1')
      @article_url = 'http://www.faz.net/' + article_block.css("a").first.attr('href')
      @full_article_page = get_html(article_url)
    end

    def data
      SiteData.new(
        newspaper: "Frankfurter Allgemeine",
        headline: article_block.css('.Headline').inner_text,
        description: article_block.css('.TeaserText').inner_text,
        link: URI.parse(article_url),
        image_url: URI.parsearticle_block.css('img').first.attr('data-src')),
        #article: full_article_page.css('p[itemprop="articleBody"]').collect {|node| node.text.strip}
        article: full_article_page.css("div > p").text

      )
    end
  end
end
