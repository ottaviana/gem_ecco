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
    end

    def test_repubblica
      crawler = Crawler.new(:repubblica)
      site_data = crawler.crawl

      assert_equal "Repubblica", site_data.newspaper
      assert_kind_of Ecco::SiteData, site_data
      assert_kind_of String, site_data.headline
      assert_kind_of String, site_data.description
      assert_kind_of URI, site_data.link
      assert_kind_of URI, site_data.image_url
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
    end
  end
end
