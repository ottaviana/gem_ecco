module Ecco
  class MoroccoAdapter < Adapter

    def initialize
      @root_uri = 'https://www.moroccoworldnews.com/'
      @article_block = get_html(root_uri).css('.td-big-grid-wrapper')
      @article_url =  article_block.css('a')[1].attr('href')
      @full_article_page = get_html(article_url)
    end

    def data
      return SiteData.new(
        newspaper: "Morocco World News",
        headline: article_block.css('a')[1].attr('title'),
        description: full_article_page.css('.m_8015943910318745746gmail-MsoNoSpacing')[0].text,
        link: URI.parse(article_url),
        image_url: URI.parse(article_block.css('img')[0].attr('src')),
        article: full_article_page.css("div > p").text
      )
    end
  end
end
