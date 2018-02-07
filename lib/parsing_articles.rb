require "parsing_articles/version"
require 'rss'
require 'open-uri' 
require 'koala' 
module ParsingArticles
  class StandartParser
    def initialize(url)
      @url = url
    end

    def parse; end

    def get_array; end
  end

  class Facebook < StandartParser
    def parse
               
    end

    def get_array
              
    end

    def self.config_facebook(app_id = nil, app_secret = nil)
    
    end

    private
    def self.get_app_access_token
      
    end
  end

  class Rss < StandartParser
    def parse
     rss = RSS::Parser.parse(@url, false).items
    end

    def get_array
      parse.map do |result|
      result = { 'title' => result.title, 
      'created_time' => result.pubDate, 
      'link' => result.link, 
      'picture' => result.description[/img.*?src="(.*?)"/i,1], 
      'message' => result.description.gsub(/<\/?[^>]*>/, "")}
    end
  end

  class Parse < StandartParser
    def get_array
      facebook_or_rss.to_a
    end

    private
    def facebook_or_rss
      /https:\/\/www.facebook.com/.match(@url) ? Facebook.new().get_array : Rss.new().get_array 
    end
  end
end
