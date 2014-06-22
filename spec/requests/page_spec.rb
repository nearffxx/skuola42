require "rails_helper"

describe "TestPages", :type => :request do
  describe "GET /" do
    it do
      get root_path
      expect(response.status).to be(200)
    end
  end
  
  describe "GET /home" do
    it do
      get home_path
      expect(response.status).to be(200)
    end
  end
end
