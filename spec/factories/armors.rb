FactoryBot.define do
  factory :armor do
    name {"#{Faker::Food.ingredient}".capitalize}
    defense_points {Faker::Number.between(1, 10)}
    durability {Faker::Number.between(1, 10)}
    price {Faker::Number.between(1, 50)}
  end
end
