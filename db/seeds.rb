# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(email: 'admin@admin.com', password: 'password')

User.create(name: "遊佐太郎", name_kana: "ユーザタロウ", nickname: "ユウ", email: "test@test.com", password: "password")

# genreの作成
genre_names = ['洗面用品','台所用品','風呂用品','掃除用品','その他']
genre_names.each do |genre_name|
  Genre.create!(
    title: genre_name,
    status: [true, false].sample
  )
end
# genre/

# productの作成
10.times do |n|
    Product.create!(
        genre_id: rand(1..4),
        name: "サンプル商品#{n + 1}",
        introduction: "sample text#{n + 1}",
        status: [true, false].sample
    )
end
# product/
