json.array! @zombies do |zombie|
  json.extract! zombie, :id, :name, :hit_points, :brains_eaten, :speed, :turn_date
end
