
RSpec.describe ParsingArticles do
  describe "Testing Facebook connection and parsing" do
    it "rhzzzz" do
    VCR.use_cassette("vcr_facebook") do
        @facebook = ParsingArticles::Parse.new('https://www.facebook.com/jonloomerdigital/').get_array
        
        expect(@facebook).to be_kind_of(Array)
          end
             
    end
  end

  describe "if nothing given" do
    it "rss_parser method raise an error" do
      expect{ParsingArticles::Parse.new('').get_array}.to raise_error(NoMethodError)
    end
  end

  
end
