class Article < ActiveRecord::Base
	has_many :comments

	validates :title, presence: true ,uniqueness: true, length: {minimum: 5}
end
