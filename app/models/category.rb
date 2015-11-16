class Category < ActiveRecord::Base
	has_many :lessons
	validates :name, uniqueness: {case_sensitive: true},
			presence: true
end
