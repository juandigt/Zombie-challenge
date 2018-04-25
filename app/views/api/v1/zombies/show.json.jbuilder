json.extract! @zombie, :id, :name, :hit_points, :brains_eaten, :speed, :turn_date
json.armors @zombie.armors do |armor|
  json.extract! armor, :id, :name, :defense_points, :durability, :price
end
json.weapons @zombie.weapons do |weapon|
  json.extract! weapon, :id, :name, :attack_points, :durability, :price
end
