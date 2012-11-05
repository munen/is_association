require 'spec_helper'

describe 'ActiveRecord::Base', %q{
  This is a spec for a  MonkeyPatch on ActiveRecord::Base.
  It's exposing a method is_association? to find out wheter
  a relation is an association.
} do


  before(:each) do
    ActiveRecord::Base.establish_connection :adapter => "sqlite3", :database => ":memory:"

    ActiveRecord::Migration.create_table :posts do |t|
      t.string :name
      t.timestamps
    end
    ActiveRecord::Migration.create_table :comments do |t|
      t.integer :post_id
      t.timestamps
    end

    class Post < ActiveRecord::Base
      has_many :comments
    end

    class Comment < ActiveRecord::Base
      belongs_to :post
    end
  end


  it 'responds to is_association?' do
    post = Post.new
    post.should respond_to(:is_association?)
  end

  it 'responds with "true" when relation is an association' do
    post = Post.new
    post.is_association?(:comments).should == true
  end

  it 'responds with "true" when relation is as string' do
    post = Post.new
    post.is_association?('comments').should == true
  end

  it 'responds with "false" when relation is not an association' do
    post = Post.new
    post.is_association?(:name).should == false
  end

end
