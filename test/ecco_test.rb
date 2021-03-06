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

    def test_la_gazzetta
      crawler = Crawler.new(:gazzetta)
      site_data = crawler.crawl

      assert_equal "La Gazzetta dello Sport", site_data.newspaper
      assert_kind_of Ecco::SiteData, site_data
      assert_kind_of String, site_data.headline
      assert_kind_of String, site_data.description
      assert_kind_of URI, site_data.link
      assert_kind_of URI, site_data.image_url
      assert_kind_of String, site_data.article
    end

    def test_equipe
      crawler = Crawler.new(:equipe)
      site_data = crawler.crawl

      assert_equal "L'ÉQUIPE", site_data.newspaper
      assert_kind_of Ecco::SiteData, site_data
      assert_kind_of String, site_data.headline
      assert_kind_of String, site_data.description
      assert_kind_of URI, site_data.link
      assert_kind_of URI, site_data.image_url
      assert_kind_of String, site_data.article
    end

    def test_sportes
      crawler = Crawler.new(:sportes)
      site_data = crawler.crawl

      assert_equal "SPORT", site_data.newspaper
      assert_kind_of Ecco::SiteData, site_data
      assert_kind_of String, site_data.headline
      assert_kind_of String, site_data.description
      assert_kind_of URI, site_data.link
      assert_kind_of URI, site_data.image_url
      assert_kind_of String, site_data.article
    end

    def test_aftenposten
      crawler = Crawler.new(:aftenposten)
      site_data = crawler.crawl

      assert_equal "Aftenposten", site_data.newspaper
      assert_kind_of Ecco::SiteData, site_data
      assert_kind_of String, site_data.headline
      assert_kind_of String, site_data.description
      assert_kind_of URI, site_data.link
      assert_kind_of URI, site_data.image_url
      assert_kind_of String, site_data.article
    end

    def test_cumhuriyet
      crawler = Crawler.new(:cumhuriyet)
      site_data = crawler.crawl

      assert_equal "Cumhuriyet", site_data.newspaper
      assert_kind_of Ecco::SiteData, site_data
      assert_kind_of String, site_data.headline
      assert_kind_of String, site_data.description
      assert_kind_of URI, site_data.link
      assert_kind_of URI, site_data.image_url
      assert_kind_of String, site_data.article
    end

    def test_independent
      crawler = Crawler.new(:independent)
      site_data = crawler.crawl

      assert_equal "Independent", site_data.newspaper
      assert_kind_of Ecco::SiteData, site_data
      assert_kind_of String, site_data.headline
      assert_kind_of String, site_data.description
      assert_kind_of URI, site_data.link
      assert_kind_of URI, site_data.image_url
      assert_kind_of String, site_data.article
    end

    def test_ilsole
      crawler = Crawler.new(:ilsole)
      site_data = crawler.crawl

      assert_equal "Il sole", site_data.newspaper
      assert_kind_of Ecco::SiteData, site_data
      assert_kind_of String, site_data.headline
      assert_kind_of String, site_data.description
      assert_kind_of URI, site_data.link
      assert_kind_of URI, site_data.image_url
      assert_kind_of String, site_data.article
    end

    def test_wienerzeitung
      crawler = Crawler.new(:wienerzeitung)
      site_data = crawler.crawl

      assert_equal "Wienerzeitung", site_data.newspaper
      assert_kind_of Ecco::SiteData, site_data
      assert_kind_of String, site_data.headline
      assert_kind_of String, site_data.description
      assert_kind_of URI, site_data.link
      assert_kind_of URI, site_data.image_url
      assert_kind_of String, site_data.article
    end

    def test_financialtimes
      crawler = Crawler.new(:financialtimes)
      site_data = crawler.crawl

      assert_equal "Financial Times", site_data.newspaper
      assert_kind_of Ecco::SiteData, site_data
      assert_kind_of String, site_data.headline
      assert_kind_of String, site_data.description
      assert_kind_of URI, site_data.link
      assert_kind_of URI, site_data.image_url
      assert_kind_of String, site_data.article
    end

    def test_bloomberg
      crawler = Crawler.new(:bloomberg)
      site_data = crawler.crawl

      assert_equal "Bloomberg", site_data.newspaper
      assert_kind_of Ecco::SiteData, site_data
      assert_kind_of String, site_data.headline
      assert_kind_of String, site_data.description
      assert_kind_of URI, site_data.link
      assert_kind_of URI, site_data.image_url
      assert_kind_of String, site_data.article
    end

    def test_forbesus
      crawler = Crawler.new(:forbesus)
      site_data = crawler.crawl

      assert_equal "Forbes US", site_data.newspaper
      assert_kind_of Ecco::SiteData, site_data
      assert_kind_of String, site_data.headline
      assert_kind_of String, site_data.description
      assert_kind_of URI, site_data.link
      assert_kind_of URI, site_data.image_url
      assert_kind_of String, site_data.article
    end

    def test_forbeseurope
      crawler = Crawler.new(:forbeseurope)
      site_data = crawler.crawl

      assert_equal "Forbes EU", site_data.newspaper
      assert_kind_of Ecco::SiteData, site_data
      assert_kind_of String, site_data.headline
      assert_kind_of String, site_data.description
      assert_kind_of URI, site_data.link
      assert_kind_of URI, site_data.image_url
      assert_kind_of String, site_data.article
    end

    def test_protothema
      crawler = Crawler.new(:protothema)
      site_data = crawler.crawl

      assert_equal "Protothema", site_data.newspaper
      assert_kind_of Ecco::SiteData, site_data
      assert_kind_of String, site_data.headline
      assert_kind_of String, site_data.description
      assert_kind_of URI, site_data.link
      assert_kind_of URI, site_data.image_url
      assert_kind_of String, site_data.article
    end

    def test_dn
      crawler = Crawler.new(:dn)
      site_data = crawler.crawl

      assert_equal "Diario de Noticias", site_data.newspaper
      assert_kind_of Ecco::SiteData, site_data
      assert_kind_of String, site_data.headline
      assert_kind_of String, site_data.description
      assert_kind_of URI, site_data.link
      assert_kind_of URI, site_data.image_url
      assert_kind_of String, site_data.article
    end

    def test_morocco
      crawler = Crawler.new(:morocco)
      site_data = crawler.crawl

      assert_equal "Morocco World News", site_data.newspaper
      assert_kind_of Ecco::SiteData, site_data
      assert_kind_of String, site_data.headline
      assert_kind_of String, site_data.description
      assert_kind_of URI, site_data.link
      assert_kind_of URI, site_data.image_url
      assert_kind_of String, site_data.article
    end
  end

  def test_berlingske
    crawler = Crawler.new(:berlingske)
    site_data = crawler.crawl

    assert_equal "Berlingske", site_data.newspaper
    assert_kind_of Ecco::SiteData, site_data
    assert_kind_of String, site_data.headline
    assert_kind_of String, site_data.description
    assert_kind_of URI, site_data.link
    assert_kind_of URI, site_data.image_url
    assert_kind_of String, site_data.article
  end

  def test_fakt
    crawler = Crawler.new(:fakt)
    site_data = crawler.crawl

    assert_equal "Fakt", site_data.newspaper
    assert_kind_of Ecco::SiteData, site_data
    assert_kind_of String, site_data.headline
    assert_kind_of String, site_data.description
    assert_kind_of URI, site_data.link
    assert_kind_of URI, site_data.image_url
    assert_kind_of String, site_data.article
  end


  def test_adevarul
    crawler = Crawler.new(:adevarul)
    site_data = crawler.crawl

    assert_equal "Adevarul", site_data.newspaper
    assert_kind_of Ecco::SiteData, site_data
    assert_kind_of String, site_data.headline
    assert_kind_of String, site_data.description
    assert_kind_of URI, site_data.link
    assert_kind_of URI, site_data.image_url
    assert_kind_of String, site_data.article
  end

  def test_sports_illustrated
    crawler = Crawler.new(:sports_illustrated)
    site_data = crawler.crawl

    assert_equal "Sports Illustrated", site_data.newspaper
    assert_kind_of Ecco::SiteData, site_data
    assert_kind_of String, site_data.headline
    assert_kind_of String, site_data.description
    assert_kind_of URI, site_data.link
    assert_kind_of URI, site_data.image_url
    assert_kind_of String, site_data.article
  end

  def test_sport_allgemein
    crawler = Crawler.new(:sport_allgemein)
    site_data = crawler.crawl

    assert_equal "Sport Allgemein", site_data.newspaper
    assert_kind_of Ecco::SiteData, site_data
    assert_kind_of String, site_data.headline
    assert_kind_of String, site_data.description
    assert_kind_of URI, site_data.link
    assert_kind_of URI, site_data.image_url
    assert_kind_of String, site_data.article
  end

  def test_sport_ch
    crawler = Crawler.new(:sport_ch)
    site_data = crawler.crawl

    assert_equal "Sport.ch", site_data.newspaper
    assert_kind_of Ecco::SiteData, site_data
    assert_kind_of String, site_data.headline
    assert_kind_of String, site_data.description
    assert_kind_of URI, site_data.link
    assert_kind_of URI, site_data.image_url
    assert_kind_of String, site_data.article
  end

  def test_sky_sport
    crawler = Crawler.new(:sky_sport)
    site_data = crawler.crawl

    assert_equal "Sky Sport", site_data.newspaper
    assert_kind_of Ecco::SiteData, site_data
    assert_kind_of String, site_data.headline
    assert_kind_of String, site_data.description
    assert_kind_of URI, site_data.link
    assert_kind_of URI, site_data.image_url
    assert_kind_of String, site_data.article
  end

  def test_sport_express
    crawler = Crawler.new(:sport_express)
    site_data = crawler.crawl

    assert_equal "Sport Express", site_data.newspaper
    assert_kind_of Ecco::SiteData, site_data
    assert_kind_of String, site_data.headline
    assert_kind_of String, site_data.description
    assert_kind_of URI, site_data.link
    assert_kind_of URI, site_data.image_url
    assert_kind_of String, site_data.article
  end

  def test_japan_sport
    crawler = Crawler.new(:japan_sport)
    site_data = crawler.crawl

    assert_equal "Japan Sport", site_data.newspaper
    assert_kind_of Ecco::SiteData, site_data
    assert_kind_of String, site_data.headline
    assert_kind_of String, site_data.description
    assert_kind_of URI, site_data.link
    assert_kind_of URI, site_data.image_url
    assert_kind_of String, site_data.article
  end

  def test_expansion
    crawler = Crawler.new(:expansion)
    site_data = crawler.crawl

    assert_equal "Expansion", site_data.newspaper
    assert_kind_of Ecco::SiteData, site_data
    assert_kind_of String, site_data.headline
    assert_kind_of String, site_data.description
    assert_kind_of URI, site_data.link
    assert_kind_of URI, site_data.image_url
    assert_kind_of String, site_data.article
  end

end
