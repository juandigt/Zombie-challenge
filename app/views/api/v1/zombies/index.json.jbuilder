json.array! @zombies do |zombie|
  json.extract! zombie, :id, :name, :hit_points, :brains_eaten, :speed, :turn_date
    json.weapons zombie.weapons do |weapon|
      json.extract! weapon, :name
    end
    json.armors zombie.armors do |armor|
      json.extract! armor, :name
    end
end


