require "spec_helper"

describe Location do
  let(:latitude) { 38.911268 }
  let(:longitude) { -77.444243 }
  let(:air_space) { Location.new(:latitude => 38.911268,
                                 :longitude => -77.444243) }
  describe "#initialize" do
    subject(:loc) { air_space }
    it do
      expect(loc.latitude).to  eq(latitude)
    end
    it do
      expect(loc.longitude).to eq(longitude)
    end
  end

  describe "#near?" do
    context "when within the specified radius" do
      subject { air_space }
      it { should be_near(latitude, longitude, 1) }
    end
    context "when outside the specified radius" do
      subject { air_space }
      it { should_not be_near(latitude * 10, longitude * 10, 1) }
    end
  end

  describe "Example" do
    subject { { :key1 => "value1", :key2 => "value2" } }
    it "should have a size of 2" do
      expect(subject.size).to eq(2)
    end
  end

  describe "Example2" do
    subject { { :key1 => "value1", :key2 => "value2" } }
    it { expect(:size) == 2 }
  end

  context "when a negative radius is used" do
  it "raises an error" do
    expect { air_space.near?(latitude, longitude, -1) }
    .to raise_error ArgumentError
    end
  end

describe "Comparisons" do
  subject { 42 }
  it { should be > 41 }
  it { should be >= 42 }
  it { should be <= 42 }
  it { should be < 43 }
end



  describe "Equal" do
    let(:address) { "123 Main Street" }
    subject { "123 Main Street" }
    it { should eq '123 Main Street' }
    it { should == "123 Main Street" }
    it { should_not == "789 Any Circle" }
    it { should_not be(address) } # object equality
    it { should_not equal(address) } # object equality too
    it { should eql(address) }
    it { should == address }
  end

end
