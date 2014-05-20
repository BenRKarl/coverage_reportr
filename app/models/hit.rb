class Hit < ActiveRecord::Base
  belongs_to :coverage_report
  require 'open-uri'
  require 'uri'
  require 'csv'


  def self.get_publication(url)
    host = URI.parse(url).host
    if host[0] == "w"
      URI.parse(url).host.split(".")[1..-2].first
    else
      URI.parse(url).host.split(".").first
    end
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

  def self.to_csv(hits)
    CSV.generate do |csv|
      csv << column_names
        hits.each do |hit|
          csv << hit.attributes.values_at(*column_names)
      end
    end
  end

end
