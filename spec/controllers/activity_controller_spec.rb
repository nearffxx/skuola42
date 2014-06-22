# spec/model/contact.rb
require "rails_helper"

describe ActivitiesController do

  describe "GET #index" do

    it "populates an array of contacts" do
      activity = FactoryGirl.create(:activity)
      get :index
      expect(assigns(:activities)).to eq([activity])
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template('index')
    end
  end
end