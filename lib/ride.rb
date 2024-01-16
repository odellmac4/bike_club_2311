class Ride

    attr_reader :name, :distance, :terrain

    def initialize(info)
        @name = info[:name]
        @distance = info[:distance]
        @loop = info[:loop]
        @terrain = info[:terrain]
    end

    def loop?
        @loop
    end

    def total_distance
        if !@loop
            @distance * 2 
        else
            @distance
        end
    end
end