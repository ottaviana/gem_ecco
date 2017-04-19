require 'test_helper'

module Ecco
  class EccoTest < Minitest::Test
    def test_that_it_has_a_version_number
      refute_nil ::Ecco::VERSION
    end

    def test_le_monde
      crawler = Crawler.new(:lemonde)
      site_data = crawler.crawl

      assert_equal "Le Monde", site_data.newspaper
      assert_kind_of Ecco::SiteData, site_data
      assert_kind_of String, site_data.headline
      assert_kind_of String, site_data.description
      assert_kind_of URI, site_data.link
      assert_kind_of URI, site_data.image_url
      assert_kind_of String, site_data.article
    end

    def test_nzz
      crawler = Crawler.new(:nzz)
      site_data = crawler.crawl

      assert_equal "Neue Zürcher Zeitung", site_data.newspaper
      assert_kind_of Ecco::SiteData, site_data
      assert_kind_of String, site_data.headline
      assert_kind_of String, site_data.description
      assert_kind_of URI, site_data.link
      assert_kind_of URI, site_data.image_url
      assert_kind_of String, site_data.article
    end

    def test_corriere
      crawler = Crawler.new(:corriere)
      site_data = crawler.crawl

      assert_equal "Corriere della Sera", site_data.newspaper
      assert_kind_of Ecco::SiteData, site_data
      assert_kind_of String, site_data.headline
      assert_kind_of String, site_data.description
      assert_kind_of URI, site_data.link
      assert_kind_of URI, site_data.image_url
      assert_kind_of String, site_data.article
    end

    def test_daily_mail
      crawler = Crawler.new(:dailymail)
      site_data = crawler.crawl

      assert_equal "The Daily Mail", site_data.newspaper
      assert_kind_of Ecco::SiteData, site_data
      assert_kind_of String, site_data.headline
      assert_kind_of String, site_data.description
      assert_kind_of URI, site_data.link
      assert_kind_of URI, site_data.image_url
      assert_kind_of String, site_data.article
    end

    def test_nyt
      crawler = Crawler.new(:nyt)
      site_data = crawler.crawl

      assert_equal "New York Times", site_data.newspaper
      assert_kind_of Ecco::SiteData, site_data
      assert_kind_of String, site_data.headline
      assert_kind_of String, site_data.description
      assert_kind_of URI, site_data.link
      # NOTE: No image_url because of paywall
      # assert_kind_of URI, site_data.image_url
    end

    def test_elpais
      crawler = Crawler.new(:elpais)
      site_data = crawler.crawl

      assert_equal "El País", site_data.newspaper
      assert_kind_of Ecco::SiteData, site_data
      assert_kind_of String, site_data.headline
      assert_kind_of String, site_data.description
      assert_kind_of URI, site_data.link
      assert_kind_of URI, site_data.image_url
      assert_kind_of String, site_data.article
    end

    def test_guardian
      crawler = Crawler.new(:guardian)
      site_data = crawler.crawl

      assert_equal "The Guardian", site_data.newspaper
      assert_kind_of Ecco::SiteData, site_data
      assert_kind_of String, site_data.headline
      assert_kind_of String, site_data.description
      assert_kind_of URI, site_data.link
      assert_kind_of URI, site_data.image_url
      assert_kind_of String, site_data.article
    end

    def test_asahi
      crawler = Crawler.new(:asahi)
      site_data = crawler.crawl

      assert_equal "The Asahi Shimbun", site_data.newspaper
      assert_kind_of Ecco::SiteData, site_data
      assert_kind_of String, site_data.headline
      assert_kind_of String, site_data.description
      assert_kind_of URI, site_data.link
      assert_kind_of URI, site_data.image_url
      assert_kind_of String, site_data.article
    end

    def test_faz
      crawler = Crawler.new(:faz)
      site_data = crawler.crawl

      assert_equal "Frankfurter Allgemeine", site_data.newspaper
      assert_kind_of Ecco::SiteData, site_data
      assert_kind_of String, site_data.headline
      assert_kind_of String, site_data.description
      assert_kind_of URI, site_data.link
      assert_kind_of URI, site_data.image_url
      assert_kind_of String, site_data.article
    end

    def test_nrc
      crawler = Crawler.new(:nrc)
      site_data = crawler.crawl

      assert_equal "NRC", site_data.newspaper
      assert_kind_of Ecco::SiteData, site_data
      assert_kind_of String, site_data.headline
      assert_kind_of String, site_data.description
      assert_kind_of URI, site_data.link
      assert_kind_of URI, site_data.image_url
      assert_kind_of String, site_data.article
    end

    def test_kommersant
      crawler = Crawler.new(:kommersant)
      site_data = crawler.crawl

      assert_equal "Kommersant", site_data.newspaper
      assert_kind_of Ecco::SiteData, site_data
      assert_kind_of String, site_data.headline
      assert_kind_of String, site_data.description
      assert_kind_of URI, site_data.link
      assert_kind_of URI, site_data.image_url
      assert_kind_of String, site_data.article
    end

    def test_dagens_nyheter
      crawler = Crawler.new(:dagensnyheter)
      site_data = crawler.crawl

      assert_equal "Dagens Nyheter", site_data.newspaper
      assert_kind_of Ecco::SiteData, site_data
      assert_kind_of String, site_data.headline
      assert_kind_of String, site_data.description
      assert_kind_of URI, site_data.link
      assert_kind_of URI, site_data.image_url
      assert_kind_of String, site_data.article
    end
  end
end
