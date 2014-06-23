require 'rails_helper'

describe Activity do

  it "has a valid factory"do
    FactoryGirl.create(:activity).should be_valid
  end

  it "creation is ok" do
    activity = FactoryGirl.create(:activity, name: "ciao")
    expect(activity.name).to eq("ciao")
  end
end