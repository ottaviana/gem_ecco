module Ecco
  class DailymailAdapter < Adapter

    def initialize
      @root_uri = 'http://www.dailymail.co.uk/home/index.html'
      @article_block = get_html(root_uri).css('.gamma')
      @article_url = "http://www.dailymail.co.uk/" + article_block.css('.article a').first.attr('href')
      @full_article_page = get_html(article_url)
    end

    # def article
    #   article_url = "http://www.dailymail.co.uk/" + article_block.css('.article a').first.attr('href')article_url =
    #   article_page = get_html(article_url)
    #   binding.pry
    # end

    def data
      SiteData.new(
        newspaper: "The Daily Mail",
        headline: article_block.css('.linkro-darkred > a').text,
        description: article_block.css('.articletext > div > p').first.inner_text,
        link: URI.parse("http://www.dailymail.co.uk/" + article_block.css('.article a').first.attr('href')),
        image_url: URI.parse(article_block.css('.article img').first.attr('data-src')),
        #article: full_article_page.css("div[itemprop=articleBody] > p").text
        #article: full_article_page.xpath("//div/p").collect {|node| node.text.strip}

        # "<p>#{n.text.strip}</p>"  -->      "<p>" + n.text.strip + "</p>"

        # [ "<p>mike</p>", "<p>otti</p>", "<p>bob</p>" ].join   -> "<p>mike</p><p>otti</p><p>bob</p>"

        article: full_article_page.css("div[itemprop=articleBody] > p").map { |n| "<p>" + n.text.strip() + "</p>" }.join
      )
    end
  end
end
