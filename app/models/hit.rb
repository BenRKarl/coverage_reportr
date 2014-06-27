class Hit < ActiveRecord::Base
  belongs_to :coverage_report
  require 'open-uri'
  require 'uri'
  require 'csv'

  # A lot of the logic here has to do with external things that become part of
  # the system. You should create an object with the sole responsibility
  # of transforming outside data into internally acceptable data.
  # These are called adapter layers, or anticorruption layers.

  AlchemyAPI.key = ENV.fetch('ALCHEMY_API_KEY')

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

  def self.get_author(url)
    AlchemyAPI::AuthorExtraction.new.search(:url => url)['author']
  end

  def self.get_sentiment(url)
    AlchemyAPI::SentimentAnalysis.new.search(:url => url)['type']
  end

  #Unused find-text method, not in scope of app but too potentially useful to delete
  def self.get_text(url)
    AlchemyAPI::TextExtraction.new.search(:url => url)
  end

  def self.to_csv(hits)
    column_names = ["Publication", "Title", "URL", "Author", "Date", "Tone"]
    CSV.generate do |csv|
      csv << column_names
      hits.each do |hit|
        csv << column_names.map { |key| hit[key] }
      end
    end
  end

end
