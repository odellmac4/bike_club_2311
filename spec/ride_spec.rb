require './lib/ride'

RSpec.describe Ride do
    before(:each) do
      @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})

      @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    end
  
    describe 'ride' do
      it 'is a ride' do
        expect(@ride1).to be_a Ride
      end
  
      it 'has a name' do
        expect(@ride1.name).to eq("Walnut Creek Trail")
      end
    end

    describe '#loop?' do
        it 'does it loop?' do 
            expect(@ride1.loop?).to eq false
            expect(@ride2.loop?).to eq true
        end
    end

    describe '#total_distance' do
        it 'The total distance is double the base distance if the ride is not a loop' do
            expect(@ride1.total_distance).to eq 21.4
            expect(@ride2.total_distance).to eq 14.9
        end
    end
end