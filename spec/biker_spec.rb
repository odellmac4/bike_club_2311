require './lib/ride'
require './lib/biker'

RSpec.describe Biker do
    before(:each) do
      @biker = Biker.new("Kenny", 30)
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
end