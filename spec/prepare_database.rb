ActiveRecord::Base.establish_connection :adapter => "sqlite3", :database => ":memory:"

ActiveRecord::Migration.create_table :posts do |t|
  t.string :name
  t.timestamps
end
ActiveRecord::Migration.create_table :comments do |t|
  t.integer :post_id
  t.timestamps
end
ActiveRecord::Migration.create_table :users do |t|
  t.integer :post_id
  t.timestamps
end
ActiveRecord::Migration.create_table :comments_users do |t|
  t.integer :user_id
  t.integer :comment_id
end

class Post < ActiveRecord::Base
  has_many :comments
  has_one :user
end

class Comment < ActiveRecord::Base
  belongs_to :post
  has_and_belongs_to_many :users
end

class User < ActiveRecord::Base
end
