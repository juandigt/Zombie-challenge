json.array! @weapons do |weapon|
  json.extract! weapon, :id, :name, :attack_points, :durability, :price
end
