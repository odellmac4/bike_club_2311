class Ride

    attr_reader :name, :distance

    def initialize(info)
        @name = info[:name]
        @distance = info[:distance]
        @loop = info[:loop]
    end
end