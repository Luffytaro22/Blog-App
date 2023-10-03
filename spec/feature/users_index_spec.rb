require 'rails_helper'

RSpec.describe 'User', type: :feature do
	# Create tests users
  before do
    @user1 = User.create(
    	name: 'user1',
    	photo: 'https://i.blogs.es/7650e9/spy-x-family/500_333.jpeg',
    	bio: 'waku-waku'
    )
    @user2 = User.create(
    	name: 'user2',
    	photo: 'https://hips.hearstapps.com/hmg-prod/images/abd9e1b06f340e7479ae4f2c1b132bda1601341053-main-1672918395.jpg?crop=0.526xw:0.938xh;0.228xw,0&resize=640:*',
    	bio: 'Some bio...'
    )
  end
  context 'User in index page' do
    it 'shows usernames' do
      # Visit the users page
      visit users_path

      # Verify the usernames are displayed in the correct element tag.
       [@user1, @user2].each do |user|
           expect(page).to have_selector(".users-name", text: user.name)
       end
    end
  end
  after do
  	User.destroy_all
  end
end