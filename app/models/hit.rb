class Hit < ActiveRecord::Base
  belongs_to :coverage_report

  def self.get_title(url)
    Nokogiri::HTML(open(url)).css('title').first.content
  end

  def self.get_date(arg)
    Nokogiri::HTML(open(arg)).css('time').first.content
  end

  def self.get_author
    AlchemyAPI::AuthorExtraction.new.search(:url => Hit.self)['author']
  end

  def self.get_sentiment
    AlchemyAPI::SentimentAnalysis.new.search(:url => url)['type']
  end
  # hit_text = AlchemyAPI::TextExtraction.new.search(:url => url)
end
