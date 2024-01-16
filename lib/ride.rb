class Ride

    attr_reader :name, :distance

    def initialize(info)
        @name = info[:name]
        @distance = info[:distance]
        @loop = info[:loop]
    end

    def loop?
        @loop
    end

    def total_distance
        @distance * 2 if !@loop
    end
end