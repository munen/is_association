require 'spec_helper'

describe 'ActiveRecord::Base', %q{
  This is a spec for a  MonkeyPatch on ActiveRecord::Base.
  It's exposing a method is_association? to find out wheter
  a relation is an association.
} do

  it 'responds to is_association?' do
    post = Post.new
    post.should respond_to(:is_association?)
  end

  context 'different associations' do

    it 'responds with "true" when relation is a "has_many" association' do
      post = Post.new
      post.is_association?(:comments).should == true
    end

    it 'responds with "true" when relation is a "belongs_to" association' do
      comment = Comment.new
      comment.is_association?(:post).should == true
    end

    it 'responds with "true" when relation is a "has_one" association' do
      post = Post.new
      post.is_association?(:user).should == true
    end

    it 'responds with "true" when relation is a "has_and_belongs_to_many" association' do
      comment = Comment.new
      comment.is_association?(:users).should == true
    end

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
