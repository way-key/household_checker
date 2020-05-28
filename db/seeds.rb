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

# buy_listの作成
User.find_each do |user|
  4.times do |num|
    BuyList.create!(
      user_id: user.id,
      title: "買い物リスト#{num + 1}"
    )
  end
end
# buy_list/

# buy_list_productの作成
BuyList.find_each do |buy_list|
  6.times do |num|
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

# favoritesの作成
# fovorites/

# reviewの作成
# reviews/
