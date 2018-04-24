json.array! @armors do |armor|
  json.extract! armor, :id, :name, :attack_points, :durability, :price
end
