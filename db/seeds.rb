# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# adminの作成
Admin.create(email: 'admin@admin.com', password: 'password')
# admin/

# userの作成
10.times do |n|
  User.create!(
    name: Faker::Name.name,
    name_kana: "テストユーザー",
    nickname: Faker::Games::Pokemon.name,
    email: Faker::Internet.email,
    password: "password"
  )
end
# user/

# genreの作成
genre_names = ['洗面用品','台所用品','風呂用品','掃除用品','その他']
genre_names.each do |genre_name|
  Genre.create!(
    title: genre_name,
    status: true
  )
end
# genre/

# productの作成
30.times do |n|
    Product.create!(
        genre_id: Genre.all.sample.id,
        name: "サンプル商品#{n + 1}",
        introduction: "ここに商品説明が入ります。ここに商品説明が入ります。ここに商品説明が入ります。ここに商品説明が入ります。ここに商品説明が入ります。ここに商品説明が入ります。ここに商品説明が入ります。ここに商品説明が入ります。ここに商品説明が入ります。ここに商品説明が入ります。",
        status: [true, false].sample
    )
end
# product/

# buy_listの作成
User.find_each do |user|
  4.times do |n|
    BuyList.create!(
      user_id: user.id,
      title: "買い物リスト#{n + 1}"
    )
  end
end
# buy_list/

# buy_list_productの作成
BuyList.find_each do |buy_list|
  6.times do |n|
    BuyListProduct.create!(
      buy_list_id: buy_list.id,
      product_id: Product.all.sample.id,
      amount: rand(0..3),
      cost: ["", 30, 60].sample,
      dead_line: rand(7..30).days.since
    )
  end
end
# buy_list_prouduct/

# reviewの作成
Product.find_each do |product|
  1.times do |n|
    Review.create!(
      user_id: User.all.sample.id,
      product_id: product.id,
      score: rand(1..5),
      comment: "ここにコメントが入ります。ここにコメントが入ります。ここにコメントが入ります。ここにコメントが入ります。"
    )
  end
end
# reviews/
