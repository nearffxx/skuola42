require 'rails_helper'

describe Activity do

  it "has a valid factory"do
    FactoryGirl.create(:activity).should be_valid
  end

  it "is invalid without a firstname" do
    activity = FactoryGirl.create(:activity, name: "ciao")
    expect(activity.name).to eq("ciao")
  end

  it "is invalid without a lastname"
  
  it "returns a contact's full name as a string"
end