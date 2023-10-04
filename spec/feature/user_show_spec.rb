require 'rails_helper'

RSpec.describe 'User', type: :feature do
  # Create tests users
  before do
    @posts = []
    @user = User.create(
      name: 'user1',
      photo: 'https://i.blogs.es/7650e9/spy-x-family/500_333.jpeg',
      bio: 'waku-waku'
    )
    (1..3).each do |number|
      @posts << Post.create(
        author: @user,
        title: "New Post #{number}",
        text: "Hello, this is my #{number} post"
      )
    end
    @user.reload
  end
  context 'User in show page' do
    it 'shows username' do
      # Visit the users page
      visit user_path(@user)

      # Verify the usernames are displayed in the correct element tag.
      expect(page).to have_selector('.users-name', text: @user.name)
    end

    it 'shows profile picture' do
      visit user_path(@user)
      expect(page).to have_selector("img[src='#{@user.photo}']")
    end

    it 'shows the number of posts' do
      visit user_path(@user)
      expect(page).to have_selector('.users-posts-counter', text: "Number of posts: #{@user.posts_counter}")
    end

    it "shows the user's bio" do
      visit user_path(@user)
      expect(page).to have_selector('.user-bio', text: "Bio:\n#{@user.bio}")
    end
  end

  context 'Posts in User show page' do
    it 'shows the first 3 posts' do
      visit user_path(@user)
      # Select all the elements with 'posts' class.
      posts_elements = all('.posts')
      length_posts = posts_elements.length - 1
      # loop through each element 'posts'
      posts_elements.each_with_index do |post_element, index|
        within(post_element) do
          # Select one post in reverse order.
          post = @posts[length_posts - index]

          # Check the expectations.
          expect(page).to have_selector('a', text: post.title)
          expect(page).to have_selector('p', text: post.text.truncate(50))
          expect(page).to have_selector('p', text: "Comments: #{post.comments_counter} Likes: #{post.likes_counter}")
        end
      end
    end

    it "shows the 'See all posts' button" do
      visit user_path(@user)
      expect(page).to have_selector('.button-posts', text: 'See all posts')
    end
  end

  context 'User-Post redirections' do
    it "'See all posts' button redirects to the user's post's index page" do
      visit user_path(@user)
      # Find the username and make a click on it.
      find('.button-posts', text: 'See all posts').click
      # Expect to be redirected to the correct page.
      expect(page).to have_current_path(user_posts_path(@user))
    end

    it 'redirects to the selected post' do
      @posts.each do |post|
        visit user_path(@user)
        find('a', text: post.title).click
        expect(page).to have_current_path(user_post_path(@user, post))
      end
    end
  end

  after do
    Post.destroy_all
    User.destroy_all
  end
end
