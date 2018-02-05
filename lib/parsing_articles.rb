require "parsing_articles/version"
require 'rss'
require 'open-uri'
require 'nokogiri' 
require 'koala' 
module ParsingArticles
  class GetArticles
    def initialize(url)
      @url = url.to_s
      @articles_results = []
    end

    def self.config_facebook(app_id = nil, app_secret = nil)
      @APP_ID = app_id
      @APP_KEY = app_secret
    end

    def get_array
      facebook_or_rss
    end

    private
    def facebook_or_rss
      /https:\/\/www.facebook.com/.match(@url) ? facebook_parser : rss_parser 
    end

    def facebook_parser
      graph = Koala::Facebook::API.new(GetArticles.get_app_access_token)
      get_facebook_array(graph)
    end

    def self.get_app_access_token
      @oauth = Koala::Facebook::OAuth.new(@APP_ID || = '1977681792501372', @APP_KEY || ='920ff6a0a18835cb7b2fef5cda8cd491')
      @oauth.get_app_access_token
    end

    def get_facebook_array(graph)
      @articles_results = graph.get_connection(facebook_get_page_id, 'posts', {
      fields: ['title', 'link', 'message', 'created_time']})
    end

    def facebook_get_page_id
      page = Nokogiri::HTML(open(@url))
      page_id = /([\d]){15}/.match((page.css('head')).to_s)
    end

    def rss_parser()
      rss = RSS::Parser.parse(@url, false).items
      get_rss_array(rss) do |result|
        result = { 'title' => result.title, 'created_time' => result.pubDate, 'link' => result.link, 'message' => result.description.gsub(/<\/?[^>]*>/, "")}
        @articles_results.push(result)
      end   
    end

    def get_rss_array(rss, &block)
      rss.each &block
      @articles_results
    end
    
  end
end
