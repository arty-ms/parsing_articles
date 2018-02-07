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

    def connect; end

    def get_array;
      parse
    end
  end

  class Facebook < StandartParser
    def self.config_facebook(app_id = nil, app_secret = nil)
      @APP_ID = app_id
      @APP_KEY = app_secret
    end

    private
    def connect
      graph = Koala::Facebook::API.new(Facebook.get_app_access_token)         
    end

    def parse
      connect.get_connection(connect.get_object('', id: @url)['id'], 'posts', {
      fields: ['title', 'link', 'message', 'picture', 'created_time']})           
    end

    def self.get_app_access_token
      @oauth = Koala::Facebook::OAuth.new(@APP_ID ||= '1977681792501372', @APP_KEY ||='920ff6a0a18835cb7b2fef5cda8cd491')
      @oauth.get_app_access_token      
    end
  end

  class Rss < StandartParser
    private
    def connect
     rss = RSS::Parser.parse(@url, false).items
    end

    def parse
      connect.map do |result|
      result = { 'title' => result.title, 
      'created_time' => result.pubDate, 
      'link' => result.link, 
      'picture' => result.description[/img.*?src="(.*?)"/i,1], 
      'message' => result.description.gsub(/<\/?[^>]*>/, "")}
      end
    end
  end

  class Parse < StandartParser
    def get_array
      facebook_or_rss.to_a
    end

    private
    def facebook_or_rss
      /https:\/\/www.facebook.com/.match(@url) ? Facebook.new(@url).get_array : Rss.new(@url).get_array 
    end
  end
end
