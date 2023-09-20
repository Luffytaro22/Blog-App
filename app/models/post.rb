class Post < ApplicationRecord
	has_many :comments, :likes
  belongs_to :author, class_name: "User"
end
