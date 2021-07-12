# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@park_1 = DogPark.create!(name: "Woofs and Wags",
                        capacity: 25,
                        off_leash: false,
                        food: true)
@park_2 = DogPark.create!(name: "Puppy Prairie",
                        capacity: 50,
                        off_leash: true,
                        food: false)
@dog_1 = Dog.create!(name: 'Alfie',
                        plays_fetch: true,
                        age: 1.5,
                        breed: 'Australian Shepherd',
                        dog_park_id: @park_1.id)
@dog_2 = Dog.create!(name: 'Hazel',
                        plays_fetch: true,
                        age: 2,
                        breed: 'Nova Scotia Duck Tolling Retriever',
                        dog_park_id: @park_1.id)
@dog_3 = Dog.create!(name: 'Scout',
                        plays_fetch: false,
                        age: 5,
                        breed: 'Labrador Retriever',
                        dog_park_id: @park_2.id)
