require 'rails_helper'
require './spec/helpers/posts_helper_spec.rb'

RSpec.describe Post, type: :model do

  it 'has a title' do
    # Creating an invalid post
    post = Post.new(
      title: '',
      body: 'Test Body',
      user: curr_user,
      views: 0
    )

    # Testing the post, expecting it to not be valid
    expect(post).to_not be_valid
    
    # Give the post a title
    post.title = 'Title'

    # Rerun the test, expecting it to be valid
    expect(post).to be_valid
  end

  it 'has a body' do
    post = Post.new(
      title: 'Test',
      body: '',
      user: curr_user,
      views: 0
    )

    expect(post).to_not be_valid
    post.body = 'Test Body'
    expect(post).to be_valid
  end

  it 'has a title at least 2 characters long' do
    post = Post.new(
      title: '',
      body: 'Test Body',
      user: curr_user,
      views: 0
    )

    expect(post).to_not be_valid
    post.title = '12'
    expect(post).to be_valid
  end

  it 'has a body between 5 and 100 characters long' do 
    post = Post.new(
      title: 'Test',
      body: '',
      user: curr_user,
      views: 0
    )

    expect(post).to_not be_valid
    # Testing minimum length
    post.body = '12345'
    expect(post).to be_valid

    # Testing max length
    hundred_char_string = 'Lj9iaz9jUcSY3UQ0EIBDMXOjtdmfCR5WoLBJYuuSlJZiZyaGYmEjKgo4zSxakwHJAePoyvjDCH0aqhplFJA53c7yySFdUeHPCHn8'
    post.body = hundred_char_string
    expect(post).to be_valid

    # Test length that is too large
    post.body = hundred_char_string + '1'
    expect(post).to_not be_valid
  end

  it 'has numerical views' do
    post = Post.new(
      title: 'Test',
      body: 'Test Body',
      user: curr_user,
      views: 9
    )

    expect(post.views).to be_a(Integer)
    # expect(post).to_not be_valid
    # post.views = 2
    # expect(post).to be_valid
  end
end
