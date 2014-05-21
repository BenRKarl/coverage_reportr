# README

One thing every public relations professional has had to deal with is compiling coverage reports. This process typically involves searching for articles and then pasting information piece-by-piece into an excel grid. Now **Coverage Reportr** helps to simplify that process by automating most of the data entry and allowing multiple users to collaborate on a single report. You can even download your reports to .csv and send them as attachments or use the data for other applications.

**Once you have an account you can create a coverage report:**

![alt text](http://i.imgur.com/NkE1V1L.png "User Homepage")

**On the next page click "Add Hit" and you'll see this screen where you can paste an article URL:**

![alt text](http://i.imgur.com/cwLAFHD.png "Enter your URL")

**Submit the URL and the article's publication, title, author, tone and today's date will automatically populate the fields in the edit page. Validate that the information is correct, hit submit, and your hit will be added to your report!**

![alt text](http://i.imgur.com/NAHcxKE.png "Edit Hit Page")

**Ta-da!**

![alt text](http://i.imgur.com/MPFVHV7.png "Example coverage report with hit")

One of the coolest features of Coverage Reportr is it's ability to pull information about an article just from the URL and to save an instance as a row in a .csv file. These are all provided by the methods availble to the "hit" class model:

```ruby

  class Hit < ActiveRecord::Base
    belongs_to :coverage_report
    require 'open-uri'
    require 'uri'
    require 'csv'

  AlchemyAPI.key = ENV.fetch('ALCHEMY_API_KEY')

    #This method parses the URL string to extract just the name of the publication.
    def self.get_publication(url)
      host = URI.parse(url).host
      if host[0] == "w"
        URI.parse(url).host.split(".")[1..-2].first
      else
        URI.parse(url).host.split(".").first
      end
    end

    #Here Nokogiri helps find the article title by seeking the "title" css selector, it works most of the time.
    def self.get_title(url)
      Nokogiri::HTML(open(url)).css('title').first.content
    end

    #AlchemyAPI is a logic-based text reader that intelligently identifies the author of an article.
    def self.get_author(url)
      AlchemyAPI::AuthorExtraction.new.search(:url => url)['author']
    end

    #It can even tell you whether the article is positive or negative in tone, which is an important feature for PR people.
    def self.get_sentiment(url)
      AlchemyAPI::SentimentAnalysis.new.search(:url => url)['type']
    end

    #This method extracts the full body of an article, but it's currently not utilized in the current feature-set.
    def self.get_text(url)
      AlchemyAPI::TextExtraction.new.search(:url => url)
    end

    #This method enables coverage reports to be downloaded in .csv format.
    def self.to_csv(hits)
      column_names = [:hit_publication, :hit_title, :hit_url, :hit_author, :hit_date, :hit_sentiment]
      CSV.generate do |csv|
          csv << column_names
          hits.each do |hit|
            csv << column_names.map { |key| hit[key] }
          end
      end
    end
  end
  
```

**Coverage Reportr takes advantage of the below technologies:**

* Ruby version 2.1.1
* Rails version 4.1.1
* Text analysis by AlchemyAPI: http://www.alchemyapi.com/api/
* Additional text analysis by Nokogiri: http://nokogiri.org/
* Coverage Reportr uses PostgreSQL for database management: http://www.postgresql.org/
* Coverage Reportr uses Skeleton for responsive (and good looking) design: http://www.getskeleton.com/

**And it has a few dependencies:**
* Nokogiri gem: https://rubygems.org/gems/nokogiri
* the AlchemyAPI gem written by johnallen3d: https://github.com/technekes/alchemy-api-rb

**Deployment Instructions:**
* When running locally - simply initiate the rails server and point your browser to localhost:3000
* Or visit Coverage Reportr on Heroku: http://coverage-reportr.herokuapp.com/

**Coverage Reportr Backlog:**
* No effective date extraction function, therefore it automatically populates with today's date.
* New York Times prevents Nokogiri from redirecting due to required log-in. Need to integrate NYT article API and add methods specifically for that site. This may be the case with other sites, but I have not come across them yet.
* When the URL is analyzed, some sites redirect the user directly to the original page:
  * ESPN.com
  * Cnet.com
