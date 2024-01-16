class BikeClub

    attr_reader :name, :bikers

    def initialize(name)
        @name = name
        @bikers = []
    end

    def add_biker(biker)
        @bikers << biker
    end

    def most_rides
        @bikers.max_by do |biker|
            biker.rides.count
        end
    end

    def best_time(ride)
        @bikers.max_by do |biker|
            biker.rides[ride]
        end
    end
    
    def bikers_eligible(ride)
        @bikers.select do |biker|
            biker.can_ride?(ride)
        end
    end
end