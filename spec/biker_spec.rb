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
    end
end