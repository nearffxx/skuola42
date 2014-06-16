require 'rails_helper'

RSpec.describe "TestPages", :type => :request do
  describe "GET /test_pages" do
    it "works! (now write some real specs)" do
      get test_pages_index_path
      expect(response.status).to be(200)
    end
  end
end
