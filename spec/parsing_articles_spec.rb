
RSpec.describe ParsingArticles do
  before do
    @article_facebook = ParsingArticles::GetArticles.new('https://www.facebook.com/jonloomerdigital/')
    @article_rss = ParsingArticles::GetArticles.new('https://www.onliner.by/feed')
  end

  describe "if nothing given" do
    it "rss_parser method raise an error" do
      expect{ParsingArticles::GetArticles.new('').rss_parser}.to raise_error(NoMethodError)
    end
  end

  describe "if facebook url given" do
    it "Returns Page_Id for Facebook" do
      expect(@article_facebook.send(:facebook_get_page_id).to_s).to eq('177748728980718')
    end

    it "facebook_parser method Returns array" do
      expect(@article_facebook.send(:facebook_parser)).to be_kind_of(Array)
    end 

    it "This array is not empty" do
      expect(@article_facebook.send(:facebook_parser).empty?).to eq(false)
    end   

    it "Returns result for facebook" do
      expect(@article_facebook.get_array).to be_kind_of(Array)
      expect(@article_facebook.get_array.empty?).to eq(false)
    end
  end

  describe "if rss url given" do
    it 'rss_parser returns array' do
      expect(@article_rss.send(:rss_parser)).to be_kind_of(Array)
    end 

    it "Returns result for facebook" do
      expect(@article_rss.get_array.empty?).to eq(false)
    end
  end

  describe "Adding Parametres APP_ID and APP_KEY" do
    it 'it returns access_token' do
      expect(ParsingArticles::GetArticles.send(:get_app_access_token)).to eq("1977681792501372|GIogiCMrqIhOxwtMgoDHeZoETt0")
    end
  end
end
