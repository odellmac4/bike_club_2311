require './lib/ride'
require './lib/biker'
require './lib/bike_club'

RSpec.describe BikeClub do
    before(:each) do
      @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

      @biker1 = Biker.new("Kenny", 30)
      @biker2 = Biker.new("Athena", 15)
      @biker3 = Biker.new("Odell", 25)

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

    describe '#most_rides' do
        it 'can tell us which Biker has logged the most (diiferent types) of rides' do
            @biker1.learn_terrain!(:gravel)
            @biker1.learn_terrain!(:hills)
            @biker2.learn_terrain!(:gravel)
            @biker2.learn_terrain!(:hills)
            
            @biker1.log_ride(@ride1, 92.5)
            @biker1.log_ride(@ride1, 91.1)
            @biker1.log_ride(@ride1, 60.9)
            @biker1.log_ride(@ride2, 59.7)
            @biker2.log_ride(@ride2, 61.6)
            @biker2.log_ride(@ride2, 62.5)

            expect(@biker1.rides).to eq ({
                @ride1 => [92.5, 91.1, 60.9],
                @ride2 => [59.7]
            })

            expect(@biker2.rides).to eq ({
                @ride2 => [61.6, 62.5]
            })

            @bike_club.add_biker(@biker1)
            @bike_club.add_biker(@biker2)

            expect(@bike_club.most_rides).to eq (@biker1)
        end
    end

    describe '#best_time(ride)' do
        it 'returns biker object with lowest time for a ride' do
            @biker1.learn_terrain!(:gravel)
            @biker1.learn_terrain!(:hills)
            @biker2.learn_terrain!(:gravel)
            @biker2.learn_terrain!(:hills)
            
            @biker1.log_ride(@ride1, 92.5)
            @biker1.log_ride(@ride1, 91.1)
            @biker1.log_ride(@ride1, 60.9)
            @biker1.log_ride(@ride2, 59.7)
            @biker2.log_ride(@ride2, 61.6)
            @biker2.log_ride(@ride2, 58.9)

            expect(@biker1.rides).to eq ({
                @ride1 => [92.5, 91.1, 60.9],
                @ride2 => [59.7]
            })

            expect(@biker2.rides).to eq ({
                @ride2 => [61.6, 58.9]
            })

            @bike_club.add_biker(@biker1)
            @bike_club.add_biker(@biker2)

            expect(@bike_club.best_time(@ride2)).to eq (@biker2)
        end
    end

    describe '#bikers_eligible(ride)' do
        it 'returns array of bikers eligible for a specific ride' do
            @bike_club.add_biker(@biker1)
            @bike_club.add_biker(@biker3)

            @biker1.learn_terrain!(:hills)
            @biker3.learn_terrain!(:gravel)
            expect(@bike_club.bikers_eligible(@ride1)).to eq ([@biker1])

            @biker3.learn_terrain!(:hills)
            expect(@bike_club.bikers_eligible(@ride1)).to eq ([@biker1, @biker3])
        end
    end
end