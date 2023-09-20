class User < ApplicationRecord
	has_many :posts, :comments, :likes
end
