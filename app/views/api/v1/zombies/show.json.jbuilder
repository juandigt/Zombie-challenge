json.extract! @zombies, :id, :name, :hit_points, :brains_eaten, :speed, :turn_date
json.armors @zombies.armors do |armour|
  json.extract! armor, :id, :name, :defense_points, :durability, :price
end
