# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

City.destroy_all
User.destroy_all
Gossip.destroy_all
Tag.destroy_all
Comment.destroy_all
CommentLike.destroy_all
GossipLike.destroy_all

5.times do
  City.create!(name: FFaker::AddressFR.city, zip_code: Faker::Address.zip_code)
end

5.times do
  User.create!(first_name: FFaker::NameFR.first_name, last_name: FFaker::NameFR.last_name, description: Faker::Adjective.negative, email: Faker::Internet.email, age: rand(14..80), city_id: City.all.sample.id)
end

20.times do
  Gossip.create!(title: Faker::Lorem.paragraph_by_chars(number: 8, supplemental: false), content: Faker::Movies::Hobbit.quote, user_id: User.all.sample.id)
end

5.times do
  Tag.create!(title: Faker::Hipster.word)
end

5.times do
  gossip = Gossip.all.sample # On choisit un gossip au hasard
  comment = Comment.create!(content: FFaker::LoremFR.sentence, user_id: User.all.sample.id, gossip_id: gossip.id) # On créé un commentaire sur ce gossip
  rand(1..3).times do #Pour chaque commentaire créé, il crée également un certain nombre de commentaires enfants (déterminé au hasard entre 1 et 3).
    child_comment = Comment.create!(content: Faker::Lorem.paragraph_by_chars(number: 140), user_id: User.all.sample.id, parent_comment_id: comment.id, gossip_id: gossip.id
    )
    comment.gossip = gossip
    child_comment.gossip = gossip
    child_comment.save
    #Une fois que le commentaire enfant est créé, le code associe le gossip d'origine à la fois au commentaire parent et au commentaire enfant avant de sauvegarder le commentaire enfant.
  end
end

10.times do
  CommentLike.create!(user_id: User.all.sample.id, comment_id: Comment.all.sample.id)
end

5.times do
  sender = User.all.sample
  recipient = User.all.sample
  while recipient == sender
    recipient = User.all.sample
  end
  PrivateMessage.create!(content: Faker::Hacker.say_something_smart, sender: sender, recipient: recipient)
end

10.times do
  GossipLike.create!(user_id: User.all.sample.id, gossip_id: Gossip.all.sample.id)
end