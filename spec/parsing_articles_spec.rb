
RSpec.describe ParsingArticles do
  describe "if facebook url was given to Parse" do
    it "if #get_array returns array" do
      VCR.use_cassette("vcr_facebook") do
        @facebook = ParsingArticles::Parse.new('https://www.facebook.com/jonloomerdigital/').get_array
        expect(@facebook).to be_kind_of(Array)
      end           
    end
  end

  describe "Testing only Facebook class" do
    it "if #get_array returns array" do
      VCR.use_cassette("vcr_facebook") do
        @facebook = ParsingArticles::Facebook.new('https://www.facebook.com/jonloomerdigital/').send(:parse)
        expect(@facebook).to be_kind_of(Array)
      end
    end
  end

  describe "if nothing given to Parse" do
    it "rss_parser method raise an error" do
      expect{ParsingArticles::Parse.new('').get_array}.to raise_error(NoMethodError)
    end
  end

  describe "if rss url was given to Parse" do
    it "if #get_array returns array" do
      VCR.use_cassette("vcr_rss") do
        @rss = ParsingArticles::Rss.new('https://www.onliner.by/feed').send(:parse)
        expect(@rss).to be_kind_of(Array)
      end
    end
  end 
end
