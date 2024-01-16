require './lib/ride'

RSpec.describe Ride do
    before(:each) do
      @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    end
  
    describe 'ride' do
      it 'is a ride' do
        expect(@ride1).to be_a Ride
      end
  
      it 'has a name' do
        expect(@ride1.name).to eq("Walnut Creek Trail")
      end
    end
end