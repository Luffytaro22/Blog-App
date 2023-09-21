require 'rails_helper'

RSpec.describe Post, type: :model do
	let(:user) { User.new(name: 'John', photo: 'www.google.com', bio: 'Hello world...') }
	let(:post) { Post.new(author: user, title: 'Hello World!', text: 'This is my first post about....') }

	context 'Adding a new Post without saving it' do
		it 'Title should be present' do
			post.title = nil
			expect(post).to_not be_valid
		end

		it 'Title should have a maximum length of 250' do
			post.title = '
			sakdfhjsdkafhskadjfhjkalsdfjlksadjfsajdf
			klsdfjlksdjflksadjflksdjflksjdfklsadjflsakd
			slkdfjlksdfjklsadfjlksadfjlksadfjlksadfjs
			alskdjaklsdjaskldjalksdjaslkdjlaakjsdfhakj
			asdklfjsldfkjsdlkfjsdlkfjsdklfjsdkfklsdfj
			skldfjsdlkfjaslkdfjlkasdfjsdalkfjslkdfsdlk
			'
			expect(post).to_not be_valid
		end

		it 'Counters should be integers' do
			expect(post.comments_counter).to be_an_instance_of(Integer)
			expect(post.likes_counter).to be_an_instance_of(Integer)
		end

		it 'Counters should be zero' do
			expect(post.comments_counter).to eq(0)
			expect(post.likes_counter).to eq(0)
		end

		it 'Recent comments should be empty' do
			expect(post.recent_comments).to be_empty
		end
	end

	context 'Updating the user posts count after saving the post' do
		before do
          user.save
          post.save
        end

  	it 'The number of posts should be 1' do
  		user.reload
  		expect(user.posts_counter).to eq(1)
  	end

  	after do
      user.reload
      post.destroy
      user.destroy
    end
  end
end