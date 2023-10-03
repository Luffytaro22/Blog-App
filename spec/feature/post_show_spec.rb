require 'rails_helper'

RSpec.describe 'Post', type: :feature do
  # Create tests users
  before do
    @comments = []
    @user = User.create(
      name: 'user1',
      photo: 'https://i.blogs.es/7650e9/spy-x-family/500_333.jpeg',
      bio: 'waku-waku'
    )

    @post = Post.create(
      author: @user,
      title: 'New Post',
      text: 'Hello, this is my new post'
    )
    @user.reload

    (1..5).each do |number|
      @comments << Comment.create(
        user: @user,
        post: @post,
        text: "My comment number: #{number}"
      )
    end
    Like.create(user: @user, post: @post)
    @post.reload
  end
  context 'Post in show page' do
    it 'shows post title and author' do
      visit user_post_path(@user, @post)

      # Verify the username is displayed in the correct element tag.
      expect(page).to have_selector('.post-title', text: "#{@post.title} by #{@user.name}")
    end

    it 'shows the number of comments/likes' do
      visit user_post_path(@user, @post)
      within('.post-title') do
        expect(page).to have_selector('p', text: "Comments: #{@post.comments_counter} Likes: #{@post.likes_counter}")
      end
    end

    it 'shows the post body' do
      visit user_post_path(@user, @post)
      within('.post') do
        expect(page).to have_selector('p', text: @post.text)
      end
    end

    it 'shows the comments' do
      visit user_post_path(@user, @post)
      @comments.each do |comment|
        within('.comments') do
          expect(page).to have_selector('p', text: "#{comment.user.name}: #{comment.text}")
        end
      end
    end
  end
  after do
    Like.destroy_all
    Comment.destroy_all
    Post.destroy_all
    User.destroy_all
  end
end
