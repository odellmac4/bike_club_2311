require './lib/ride'
require './lib/biker'

RSpec.describe Biker do
    before(:each) do
      @biker = Biker.new("Kenny", 30)

      @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})

      @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    end
  
    describe 'biker' do
      it 'is a biker' do
        expect(@biker).to be_a Biker
      end
  
      it 'has a name' do
        expect(@biker.name).to eq('Kenny')
      end

      it 'has a max distance' do
        expect(@biker.max_distance).to eq 30
      end

      it 'has rides' do 
        expect(@biker.rides).to eq ({})
      end

      it 'has acceptable terrains' do
        expect(@biker.acceptable_terrain).to eq ([])
      end
    end

    describe '#learn_terrain!' do
        it 'can learn terrains' do
            @biker.learn_terrain!(:gravel)
            @biker.learn_terrain!(:hills)
            expect(@biker.acceptable_terrain).to eq ([:gravel, :hills])
        end
    end

    describe '#log_ride' do
        it 'logs previous rides and times for those rides. will not log if the rides terrain isnt acceptable and the rides total distance is greater than biker max distance.' do
            @biker.learn_terrain!(:gravel)
            @biker.learn_terrain!(:hills)
            
            @biker.log_ride(@ride1, 92.5)
            @biker.log_ride(@ride1, 91.1)
            @biker.log_ride(@ride2, 60.9)
            @biker.log_ride(@ride2, 61.6)

            expect(@biker.rides).to eq ({
                @ride1 => [92.5, 91.1],
                @ride2 => [60.9, 61.6]
            })
        end
    end

    describe '#personal_record' do
        it 'report personal record for a specific ride. The lowest time recorded for a ride. False if ride not completed' do
            
        end
    end
end