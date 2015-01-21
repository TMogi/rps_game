# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Player.destroy_all
Player.create(name: "社畜さん", hp: 20, atk: 1, dif: 1)
Player.create(name: "きのこ先生", hp: 20, atk: 1, dif: 1)
Player.create(name: "サラマンダーよりはやい", hp: 20, atk:1, dif: 1)
Player.create(name: "花道オンステージ", hp: 20, atk:1, dif: 1)