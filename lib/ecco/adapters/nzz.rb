module Ecco
  class NzzAdapter < Adapter
    def initialize
      @root_uri =  'https://www.nzz.ch'
      @article_block = get_html(root_uri).css('.teaser--medium').first
      @article_url = "https://www.nzz.ch" + article_block.css('.teaser__link').first.attr('href')
      @full_article_page = get_html(article_url)
    end

    def data
      SiteData.new(
        newspaper: "Neue Zürcher Zeitung",
        headline: article_block.css('.title__name').inner_text,
        description: article_block.css('.teaser__lead').inner_text,
        link: URI.parse(root_uri + article_block.css('.teaser__link').first.attr('href')),
        image_url: URI.parse(article_block.css('img').attr('data-srcset').value.slice!(/http[^\s]{1,}.jpeg/)),
        #article: full_article_page.css('p[itemprop="articleBody"]').collect {|node| node.text.strip}
        article: full_article_page.css('p[itemprop="articleBody"]').map { |n| "<p>" + n.text.strip() + "</p>" }.join

      )
    end
  end
end
