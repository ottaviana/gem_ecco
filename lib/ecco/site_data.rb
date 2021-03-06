module Ecco
  # JOB: Represent Site Data that we need.
  class SiteData
    attr_reader :headline, :description, :link, :image_url, :newspaper, :article

    def initialize(args)
      @newspaper    = args[:newspaper]
      @headline     = args[:headline]
      @description  = args[:description]
      @link         = args[:link]
      @image_url    = args[:image_url]
      @article      = args[:article]
    end
  end
end
