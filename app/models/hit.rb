class Hit < ActiveRecord::Base
  belongs_to :coverage_report
  require 'open-uri'
  require 'uri'

  def self.get_publication(url)
    URI.parse(url).host.split(".")[1..-2].first
  end

  def self.get_title(url)
    Nokogiri::HTML(open(url)).css('title').first.content
  end

  # def self.get_date(url)
  #   Nokogiri::HTML(open(url)).css('time').first.content
  # end

  def self.get_author(url)
    AlchemyAPI::AuthorExtraction.new.search(:url => url)['author']
  end

  def self.get_sentiment(url)
    AlchemyAPI::SentimentAnalysis.new.search(:url => url)['type']
  end
  # hit_text = AlchemyAPI::TextExtraction.new.search(:url => url)
end
