class Biker

    attr_reader :name, :max_distance, :rides, :acceptable_terrain

    def initialize(name , max_distance)
        @name = name
        @max_distance = max_distance
        @rides = Hash.new { |h_obj, k| h_obj[k] = [] }
        @acceptable_terrain = []
    end

    def learn_terrain!(terrain)
        @acceptable_terrain << terrain
    end

    def log_ride(ride , time)
        if @acceptable_terrain.include?(ride.terrain) && ride.total_distance < @max_distance
            @rides[ride] << time
        end
        @rides
    end

    def lowest_time(ride)
       low_time = @rides[ride].min_by do |time|
            time  
        end
        low_time
    end
    
    
    def personal_record(ride)
        if @rides.keys.include?(ride)
            lowest_time(ride)
        end
    end
end