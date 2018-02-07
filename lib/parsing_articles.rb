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
     
    end

    def get_array
    
    end
  end

  class Parse < StandartParser
    def get_array
      
    end

    private
    def facebook_or_rss
      /https:\/\/www.facebook.com/.match(@url) ? Facebook.new().get_array : Rss.new().get_array 
    end
  end
end
