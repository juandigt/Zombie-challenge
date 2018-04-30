# Badi Coding Challenge - Backend (Ruby on Rails)
![Zombies at Badi](https://user-images.githubusercontent.com/4199523/33260366-e54216aa-d35f-11e7-8442-8d9e1cd67d88.jpg)

## The context
You are a scientist in a post-apocalyptic world. In your lab you have plenty of human tissues, yet not so many brains. For this reason, you decide to create zombies, which you then equip with armors and weapons. Why would you do that? Well, we cannot tell you. The only thing you need to know is that you are a crazy scientist playing on the edge of life and death.

## Instructions

* Fork this repo and clone your fork in your local machine. Alternatively, if you prefer to keep your challenge private, just download the code of this repo and send the final result to jobs@badiapp.com.
* The challenge is on! Implement the 6 steps described below;
* Create a pull request.

## What we expect
* Build a performant, clean and well structured solution;
* Commit **early and often**. We want to be able to check your progress;
* Feel free to address the problem creatively according to your programming tastes (there are always multiple ways to achieve the same goal) and try to use elegant solutions.

## The Challenge

Create a fully-working API that allows to perform the following operations:

1. Create Zombies. Each zombie can have weapons and armors;
2. Update a Zombie's attributes, including (but not limited to) weapons and armors;
4. Search Zombies according to their attributes, weapons and armors;
3. Destroy a Zombie;
5. Make your API public. Deploy it using the service of your choice (e.g. AWS, Heroku, Digital Ocean...);
6. Create a Readme file including a short explanation of your technical choices and (if you wish) ideas and suggestions.

## Solution

The project is a RESTful API wich you can manipulate the Zombie model.
For the implementation of the solution:

1. I created the models, Zombie, Armor and weapons and its routes and validations.
2. I created the basic controller for Zombie, Armor and Weapon. Definined the methods for index, show, create, update, and destroy.
3. I defined a method for add and remove armors and weapons to a Zombie.
4. Implemented the index method for search zombies by specific atributes. I used the scope  Active Record property.
5. I built the test using RSpec-rails gem. Test are done for models, routes and zombie controller. Run "bundle exec rspec" for testing.
6. I deployed the API to Heroku: https://zombie-challenge-badi.herokuapp.com/


## The API

### These are the calls to the API:


Show Zombie
- URL: /api/v1/zombies/:id
- Method: GET
- URL Params: Required: id=[integer]


Index All Zombies
- URL: /api/v1/zombies
- Method: GET
- URL Params: None

Create Zombie
- URL: api/v1/zombies
- Method: POST
- Data Params: Required: name=[string]; Not required: hit_points=[integer], brains_eaten=[integer], speed=[integer], - weapon_id=[integer], armor_id=[integer]

Update Zombie
- URL: /api/v1/zombies/:id
- Method: PUT
- URL Params: Required: id=[integer]
- Data Params: name=[string], hit_points=[integer], brains_eaten=[integer], speed=[integer], weapon_id=[integer], armor_id=[integer]

Destroy Zombie
- URL: /api/v1/zombies/:id
- Method: DELETE
- URL Params: Required: id=[integer]

Add a weapon to a Zombie
- URL: api/v1/zombies/:id/add_weapon
- Method: POST
- Data Params: Required: name=[string]; Not required: attack_points=[integer], durability=[integer], price=[integer]

Add a armor to a Zombie
- URL: api/v1/zombies/:id/add_armor
- Method: POST
- Data Params: Required: name=[string]; Not required: deffense_points=[integer], durability=[integer], price=[integer]

Remove a weapon to a Zombie
- URL: api/v1/zombies/:id/remove_weapon
- Method: POST
- Data Params: Required: name=[string]; Not required: attack_points=[integer], durability=[integer], price=[integer]

Remove a armor to a Zombie
- URL: api/v1/zombies/:id/remove_armor
- Method: POST
- Data Params: Required: name=[string]; Not required: deffense_points=[integer], durability=[integer], price=[integer]

Index All Weapons
- URL: /api/v1/weapons
- Method: GET

Show Weapon
- URL: /api/v1/weapons/:id
- Method: GET
- URL Params: Required: id=[integer]

Create Weapon
- URL: /api/v1/weapons
- Method: POST
- Data Params: Required: name=[string]; Not required: attack_points=[integer], durability=[integer], price=[integer]

Update Weapon
- URL: /api/v1/weapons/:id
- Method: PUT
- URL Params: Required: id=[integer]
- Data Params: name=[string], attack_points=[integer], durability=[integer], price=[integer]

Destroy Weapon
- URL: /api/v1/weapons/:id
- Method: DELETE
- URL Params: Required: id=[integer]

Index All Armors
- URL: /api/v1/armors
- Method: GET
- URL Params: None

Show Armor
- URL: /api/v1/armors/:id
- Method: GET
- URL Params: Required: id=[integer]

Create Armor
- URL: /api/v1/armors
- Method: POST
- Data Params: Required: name=[string]; Not required: defense_points=[integer], durability=[integer], price=[integer]

Update Armor
- URL: /api/v1/armors/:id
- Method: PUT
- URL Params: Required: id=[integer]
- Data Params: name=[string], defense_points=[integer], durability=[integer], price=[integer]

Destroy Armor
- URL: /api/v1/armors/:id
- Method: DELETE
- URL Params: Required: id=[integer]


## Used Technologies:
- ruby 2.4.3
- Rails 5.1.3
- MySQL
- Heroku
- Docker
- Postman




*** There are some task I'm still working on it. Like controller test or seed the heroku app after deployed.



