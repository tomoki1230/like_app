email = "test@example.com"
password = "password"

ActiveRecord::Base.connection.execute("TRUNCATE TABLE users RESTART IDENTITY CASCADE")

user1 = User.create!(email: "satou@example.com", password: "password")
user2 = User.create!(email: "suzuki@example.com", password: "password")
user3 = User.create!(email: "tanaka@example.com", password: "password")

user2.posts.create!(content: "沖縄そば")
user1.posts.create!(content: "海ぶどう")
user3.posts.create!(content: "ゴーヤーチャンプルー")
user3.posts.create!(content: "サーターアンダギー")
user1.posts.create!(content: "タコライス")

User.create!(email: email, password: password)

puts "初期データの投入に成功しました！"
