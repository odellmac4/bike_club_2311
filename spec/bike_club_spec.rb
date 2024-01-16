require './lib/ride'
require './lib/biker'
require './lib/bike_club'

RSpec.describe BikeClub do
    before(:each) do
      @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

      @biker1 = Biker.new("Kenny", 30)
      @biker2 = Biker.new("Athena", 15)

      @bike_club = BikeClub.new("Wild Hogs")
    end
  
    describe 'bike club' do
      it 'is a bike club' do
        expect(@bike_club).to be_a BikeClub
      end
  
      it 'has a name' do
        expect(@bike_club.name).to eq("Wild Hogs")
      end

      it 'has bikers' do
        expect(@bike_club.bikers).to eq ([])
      end
    end

    describe '#add_biker' do
        it 'adds bikers' do
            @bike_club.add_biker(@biker1)
            @bike_club.add_biker(@biker2)
            
            expect(@bike_club.bikers).to eq ([@biker1 , @biker2])
        end
    end
end