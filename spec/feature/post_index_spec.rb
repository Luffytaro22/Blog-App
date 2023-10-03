require 'rails_helper'

RSpec.describe 'Post', type: :feature do
	# Create tests users
  before do
  	@posts = []
  	@comments = []
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

    (1..5).each do |number|
    	@comments << Comment.create(
    		user: @user,
    		post: @posts[0],
    		text: "My comment number: #{number}"
    	)
    end
    Like.create(user: @user, post: @posts[1])
    @posts[0].reload
    @posts[1].reload
  end
  context 'Post in index page' do
    it 'shows username' do
      # Visit the user-posts page
      visit user_posts_path(@user)

      # Verify the username is displayed in the correct element tag.
      expect(page).to have_selector(".users-name", text: @user.name)
    end

    it 'shows profile picture' do
    	visit user_posts_path(@user)
    	expect(page).to have_selector("img[src='#{@user.photo}']")
    end

   	it 'shows the number of posts' do
   		visit user_posts_path(@user)
   		expect(page).to have_selector('.users-posts-counter', text: "Number of posts: #{@user.posts_counter}")
   	end

   	it "shows the post's titles, bodies and comments/likes counters" do
   		visit user_posts_path(@user)
   		# Select all the elements with 'posts' class.
      posts_elements = all('.posts')

      # loop through each element 'posts'
      posts_elements.each_with_index do |post_element, index|
        within(post_element) do
          # Select one post.
          post = @posts[index]

          # Check the expectations.
          expect(page).to have_selector('a', text: post.title)
          expect(page).to have_selector('p', text: post.text.truncate(50))
          expect(page).to have_selector('p', text: "Comments: #{post.comments_counter} Likes: #{post.likes_counter}")
        end
      end
   	end

   	it 'shows the first comments on a post' do
			visit user_posts_path(@user)
			posts_comments = all('.posts-comments')
			post_comment = posts_comments[0]

			within(post_comment) do
				@comments.each do |comment|
					expect(page).to have_selector('p', text: "#{comment.user.name}: #{comment.text}")
				end
			end
   	end

   	it "shows the 'Pagination' button" do
   		visit user_posts_path(@user)
   		expect(page).to have_selector('.button-posts', text: 'Pagination')
   	end
  end


  after do
  	Like.destroy_all
  	Comment.destroy_all
  	Post.destroy_all
  	User.destroy_all
  end
end