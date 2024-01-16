require './lib/ride'
require './lib/biker'
require './lib/bike_club'

RSpec.describe BikeClub do
    before(:each) do
      @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

      @bikeclub = BikeClub.new("Wild Hogs")
    end
  
    describe 'bike club' do
      it 'is a bike club' do
        expect(@bikeclub).to be_a BikeClub
      end
  
      it 'has a name' do
        expect(@bikeclub.name).to eq("Wild Hogs")
      end

      it 'has bikers' do
        expect(@bikeclub.bikers).to eq ([])
      end
    end
end