

describe "TestPages", :type => :request do
  describe "GET /test_pages" do
    it "works! (now write some real specs)" do
      visit "/home"
      page.should have_content('skuola42')
    end
  end
end
